# Benign demo service. Vulnerabilities live in pinned dependencies and the EOL base image only.
from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/health")
def health():
    return jsonify(status="ok", service="kbc-payments-demo")

@app.get("/")
def index():
    return jsonify(message="KBC Payments demo service")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
