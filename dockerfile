FROM python:3.12.8-slim-bookworm

WORKDIR /app

RUN apt-get update
RUN apt-get install -y ffmpeg

RUN pip install poetry
RUN poetry config virtualenvs.in-project true
COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root
COPY . .

CMD [".venv/bin/python", "app.py"]