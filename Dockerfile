FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN cp entrypoint.sh /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 8000

ENV HOST 0.0.0.0

ENTRYPOINT ["/entrypoint.sh"]
