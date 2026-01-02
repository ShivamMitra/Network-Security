FROM python:3.10-slim-buster

WORKDIR /app
COPY . /app

# Combine updates and installs into one layer to prevent Exit Code 100
# Adding --no-install-recommends keeps the image small
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
