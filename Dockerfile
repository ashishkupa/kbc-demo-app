# Deliberately EOL base image (Python 3.8) for UC10 end-of-life / base image findings.
FROM python:3.8-slim
WORKDIR /srv
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ .
EXPOSE 8080
CMD ["python", "main.py"]
