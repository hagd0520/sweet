FROM python:3.12.8-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

RUN apt-get update
RUN apt-get install -y ffmpeg

COPY pyproject.toml uv.lock ./
RUN uv sync
COPY . .

CMD [".venv/bin/python", "app.py"]