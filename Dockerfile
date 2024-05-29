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
RUN pip install torch torchvision torchaudio h5py nibabel numpy scipy

# Set the working directory
WORKDIR /app

# Clone WMH-SynthSeg repository
RUN git clone https://github.com/lasopablo/freesurfer-freesurfer-dev-mri_WMHsynthseg.git .

# Create models directory
RUN mkdir -p models

# Download the required atlas file from the external URL
RUN wget -O models/WMH-SynthSeg_v10_231110.pth https://ftp.nmr.mgh.harvard.edu/pub/dist/lcnpublic/dist/WMH-SynthSeg/WMH-SynthSeg_v10_231110.pth

# Define the entrypoint
ENTRYPOINT ["python", "WMHSynthSeg/inference.py"]
