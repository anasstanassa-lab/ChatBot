from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from rag_core import answer  # existing RAG function

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/rag-chat")
async def rag_chat(request: Request):
    try:
        body = await request.json()
        question = body.get("question", "")
        # Call your RAG function
        resp_text, _ = answer(question)
        return {"answer": resp_text}
    except Exception as e:
        # Return error message instead of 500
        return {"error": str(e)}
