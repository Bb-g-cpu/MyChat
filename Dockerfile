FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
# Add src/ to PYTHONPATH so Gunicorn can import main module
ENV PYTHONPATH=/app/src:$PYTHONPATH
EXPOSE 5000
CMD ["gunicorn", "--worker-class", "eventlet", "-w", "1", "main:app"]
