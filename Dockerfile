#FROM python:3.11.2-alpine3.16
FROM python:3.11.2-buster

WORKDIR /app

COPY . /app

RUN python -m venv /app/.venv
RUN . /app/.venv/bin/activate
RUN pip install -r requirements/backend.in

ENTRYPOINT uvicorn spaceship.main:app --host=0.0.0.0 --port=8080