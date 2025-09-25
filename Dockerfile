l# Base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install only what’s required
RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Default command (replace main.py with your bot’s main file)
CMD ["python", "main.py"]
