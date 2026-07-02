FROM python:3.11-slim
WORKDIR /frontend
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "main.py"]