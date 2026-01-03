import os
import psycopg2
from pgvector.psycopg2 import register_vector
from dotenv import load_dotenv

load_dotenv()

def get_conn():
    conn = psycopg2.connect(
        host=os.getenv("PG_HOST", "localhost"),
        port=os.getenv("PG_PORT", "5432"),
        dbname=os.getenv("PG_DB", "ragdb"),
        user=os.getenv("PG_USER", "raguser"),
        password=os.getenv("PG_PASSWORD", "ragpass"),
    )
    
    # Create vector extension if it doesn't exist
    with conn.cursor() as cur:
        cur.execute("CREATE EXTENSION IF NOT EXISTS vector")
        conn.commit()
    
    # Now register the vector type
    register_vector(conn)
    
    return conn