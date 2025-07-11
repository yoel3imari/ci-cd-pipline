FROM python:3.10-slim

WORKDIR /app

# Install uv
RUN curl -Ls https://astral.sh/uv/install.sh | bash

ENV PATH="/root/.cargo/bin:$PATH"

COPY pyproject.toml .

RUN uv pip install --system

COPY ./app ./app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "5000"]
