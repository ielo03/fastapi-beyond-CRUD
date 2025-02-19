#!/bin/sh
set -e

echo "Waiting for PostgreSQL to be ready..."
while ! nc -z db 5432; do
  sleep 1
done
echo "PostgreSQL is up!"

echo "Running Alembic migrations..."
alembic upgrade head

echo "Starting FastAPI server..."
exec fastapi run src --port 8000 --host 0.0.0.0
