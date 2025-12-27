FROM python:3.10-slim

# Install system dependencies untuk OpenCV dan Ultralytics
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    libgomp1 \
    libgl1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements terlebih dahulu untuk caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy seluruh isi folder model
COPY . .

# Environment variables untuk non-GUI
ENV QT_QPA_PLATFORM=offscreen
ENV ULTRALYTICS_NO_GUI=1
ENV DISPLAY=:99

# Expose port (Railway akan set PORT environment variable)
EXPOSE $PORT

# Run aplikasi
CMD ["python", "detect_server.py"]
