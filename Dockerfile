# Use Python 3.11 slim base image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependency file first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all app files (since everything is in root)
COPY . .

# Expose FastAPI default port
EXPOSE 8000

# Set Python to unbuffered mode (for cleaner logs)
ENV PYTHONUNBUFFERED=1

# Run FastAPI app with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
