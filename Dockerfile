# Use the official Python image from the Docker Hub
FROM python:3.7-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Clone WMH-SynthSeg repository
RUN git clone https://github.com/lasopablo/freesurfer-freesurfer-dev-mri_WMHsynthseg.git /wmh_synthseg

# Set the working directory
WORKDIR /wmh_synthseg

# Download the required atlas file from the external URL
RUN wget -O models/WMH-SynthSeg_v10_231110.pth <EXTERNAL_URL>

# Install SimpleITK
RUN pip install SimpleITK

# Define the entrypoint
ENTRYPOINT ["python", "WMHSynthSeg/inference.py"]
