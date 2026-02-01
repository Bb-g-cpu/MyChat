FROM python:3.11-slim
WORKDIR /app
COPY . . 
RUN pip install --no-cache-dir -r requirements.txt
CMD ["gunicorn", "--worker-class", "eventlet", "-w", "1", "-b", "0.0.0.0:8080", "app2:socketio"]

