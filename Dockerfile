ARG PYTHON_VERSION=3.8-slim
FROM python:${PYTHON_VERSION} AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

FROM python:${PYTHON_VERSION}

WORKDIR /app
ENV PYTHONUNBUFFERED=1

COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

COPY . .

RUN python manage.py migrate

EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
