CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS lectures (
    id SERIAL PRIMARY KEY,
    title TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    full_transcript TEXT
);

CREATE TABLE IF NOT EXISTS chunks (
    id SERIAL PRIMARY KEY,
    lecture_id INT REFERENCES lectures(id) ON DELETE CASCADE NOT NULL,
    chunk_text TEXT NOT NULL,
    embedding VECTOR(384) NOT NULL
);

CREATE INDEX ON chunks USING hnsw (embedding vector_cosine_ops);