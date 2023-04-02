FROM python:3.11.2-alpine3.16 AS builder
#FROM python:3.11.2-buster AS builder

COPY requirements/backend.in .
RUN python -m venv /.venv
ENV PATH="/.venv/bin:$PATH"

COPY requirements/backend.in .
RUN pip install -r backend.in

FROM python:3.11.2-alpine3.16
#FROM python:3.11.2-buster
COPY --from=builder /.venv /.venv
ENV PATH="/.venv/bin:$PATH"
COPY build build
COPY spaceship spaceship

ENTRYPOINT ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]