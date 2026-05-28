# rag-lecture-pipeline
A local RAG pipeline that transcribes audio recordings and answers questions using pgvector and Ollama. First, the user uploads an audio recording of their lecture, meeting, etc. Then, they can prompt the model with questions to receieve an answer.

## Tech Stack
- Docker & Compose
- PostgreSQL
- pgvector
- FastAPI
- Whisper
- Ollama

## How it Works
### Phase A - Ingestion Pipeline
1. Audio Upload — User submits a recording via the web interface
2. Transcription — Whisper converts the audio waveform to raw text
3. Semantic Slicing — Text is cut into overlapping chunks (~500 chars, 50 overlap)
4. Orchestration — FastAPI routes each chunk to the embedding engine
5. Embedding Model — Chunks become high-dimensional mathematical vectors
6. Persistent Storage — Text + vectors are saved to PostgreSQL/pgvector

### Phase B - Retrieval Pipeline
1. User Query — Natural-language question submitted via the UI
2. Embed Query — Same embedding model converts the question to a vector
3. Cosine Search — Database returns the top 3 most similar chunks
4. Prompt Synthesis — Chunks are injected into a structured system prompt
5. LLM Generation — Ollama/Llama 3 generates a context-grounded answer
6. UI Response — Final answer is returned to the user

## Prerequisites

## Setup