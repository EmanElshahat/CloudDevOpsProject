FROM python:3.9-slim AS builder
WORKDIR /app
COPY App/requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.9-slim
WORKDIR /app
COPY --from=builder /install /usr/local
COPY App/ .
EXPOSE 5000
CMD ["python", "app.py"]
