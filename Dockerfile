# Base image Python
FROM python:3.10-slim

# Install system dependencies untuk OpenCV
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory ke folder model
WORKDIR /app/model

# Copy requirements dan install dependencies
COPY model/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file project
COPY model/ . 

# Ekspos port Streamlit
EXPOSE 8501

# Jalankan Streamlit
CMD ["streamlit", "run", "detect_server.py", "--server.port=8501", "--server.address=0.0.0.0"]
