# Use official Python image
FROM python:3.12-slim

# Set working directory inside container
WORKDIR /app

# Install system dependencies (ffmpeg, etc.)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file if exists
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all bot files into container
COPY . .

# Environment variables (optional, you can set in Docker or Render/Heroku)
# ENV API_ID=your_api_id
# ENV API_HASH=your_api_hash
# ENV BOT_TOKEN=your_bot_token
# ENV DATABASE_URL=your_db_url

# Run the bot
CMD ["python", "bot.py"]
