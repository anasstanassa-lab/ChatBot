from typing import List  # ADD THIS IMPORT
from db import get_conn
from openai_utils import embed_text
from openai import OpenAI
import os

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def retrieve(query: str, k=5):
    q_emb = embed_text(query)
    conn = get_conn()
    with conn.cursor() as cur:
        cur.execute("""
        SELECT source, chunk, modality,
        1 - (embedding <=> %s::vector) AS score
        FROM documents
        ORDER BY embedding <=> %s::vector
        LIMIT %s
        """, (q_emb, q_emb, k))
        results = cur.fetchall()
    conn.close()  # ADD: Close connection
    return results

def answer(query: str, k=5):
    rows = retrieve(query, k=k)
    context = "\n\n".join([f"[{m}] {c}" for _, c, m, _ in rows])
    prompt = f"""
    Tu es un assistant RAG multimodal.
    Utilise STRICTEMENT le contexte pour répondre.
    Contexte:
    {context}
    Question:
    {query}
    Réponse:
    """
    resp = client.responses.create(
        model="gpt-4o",  # CHANGED: gpt-5 doesn't exist yet
        input=prompt
    )
    return resp.output_text, rows