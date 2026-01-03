import base64
from typing import List  # ADD THIS IMPORT
from openai import OpenAI
import os

client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
EMBED_MODEL = "text-embedding-3-small"

def embed_text(text: str) -> List[float]:  # CHANGE list[float] to List[float]
    resp = client.embeddings.create(model=EMBED_MODEL, input=text)
    return resp.data[0].embedding

def image_to_base64(path: str) -> str:
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()

def caption_image(path: str) -> str:
    b64 = image_to_base64(path)
    resp = client.responses.create(
        model="gpt-4o",  # CHANGED: gpt-5 doesn't exist yet, use gpt-4o or gpt-4-turbo
        input=[{
            "role": "user",
            "content": [
                {"type": "input_text",
                 "text": "Décris clairement cette image en 2-3 phrases utiles pour la recherche."},
                {"type": "input_image",
                 "image_url": f"data:image/png;base64,{b64}"}
            ]
        }]
    )
    return resp.output_text.strip()