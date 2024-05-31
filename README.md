# mri_WMHsynthseg


<blockquote>
  <p>:warning: <strong>Important Notice:</strong> The <code>wmh_synthseg</code> model has just been trained and is ready for use. A <a href="https://github.com/lasopablo/freesurfer-freesurfer-dev-mri_WMHsynthseg">Docker container</a> has been developed temporarily.</p>
</blockquote>

<p align="center">
    <h3 align="center">WMH-SynthSeg</h3>
</p>

<p align="center">
    "Quantifying White Matter Hyperintensity and Brain Volumes in Heterogeneous Clinical and Low-field portable MRI". <a href="https://github.com/lasopablo/freesurfer-freesurfer-dev-mri_WMHsynthseg">[View Project]</a>
</p>

<p align="center">
  <a href="https://surfer.nmr.mgh.harvard.edu/fswiki/WMH-SynthSeg">
    <img src="https://miro.medium.com/v2/resize:fit:2000/1*ovEGmOI3bcCeauu8jEBzsg.png" width="400" alt="Quantifying white matter hyperintensity and brain volumes">
  </a>
</p>
<p align="center">
Developed as part of my Master's thesis at MGH, Harvard Medical School, and CSAIL, MIT, this project leverages WMH-SynthSeg, an extension of SynthSeg, designed for brain MRI scans. It uniquely adapts to low-field MRI scans, providing high-resolution segmentations of white matter hyperintensities (WMH) and anatomical structures, even in challenging imaging conditions.
</p>
<p align="center">
<b>Author:</b> Pablo Laso <br>
<b>Email:</b> <a href="mailto:plaso@kth.se">plaso@kth.se</a> <br>
<b>Citation:</b> If you use WMH-SynthSeg in your analysis, please cite <a href="https://arxiv.org/abs/2312.05119">our paper</a> under review. <br>
</p>

## Installation

<p>The <code>wmh_synthseg</code> model has already been trained and is ready for use. Here are some options to run the model now:
  
  1. A **Docker is avialable temporarily. (recommended)
     
  2. Alternatively, you can clone this repository, **download the model** from the link, and add it to your path. Please note you need a big memory to run it locally.
     
  3. You can also try to use it from **FreeSurfer**. However, please note that integration with FreeSurfer is currently in progress and not yet available. In other words, running the model will not be straight-forward. Stay tuned for updates on this implementation.</p>


### (1) Docker:

1. **Downloading the Docker Container:**
     
  To download the container from Docker, use the following command:
  ```bash
      docker pull pablaso/wmh_synthseg:latest
  ```
2. **Running the Docker Container:**
     
  To run the container and process your MRI images, use the following command:
  ```bash
      docker run --rm -v /path/to/your/data:/data pablaso/wmh_synthseg --i /data/your_input_image.nii.gz --o /data/your_output_image.nii.gz
  ```

### (2) Cloning repo and changing the path:
  
  1. **Clone repository:**
  ```bash
      git clone https://github.com/lasopablo/freesurfer-freesurfer-dev-mri_WMHsynthseg.git
      cd freesurfer-freesurfer-dev-mri_WMHsynthseg
  ```
  
  2. **Change path in the inference.py file:**
  ```python
        model_file = os.path.join('/app/models', 'WMH-SynthSeg_v10_231110.pth')
  ```


### (3) Downloading the atlas (official):

This section documents how to download and install the atlas file required by the
mri_WMHsynthseg utility. General usage and utility description can be found at:
    
    https://surfer.nmr.mgh.harvard.edu/fswiki/WMH-SynthSeg

This utility requires an atlas file that does not ship with the standard install
of FreeSurfer. This is done in an effort to keep the size of the installer
reasonable. The utility expects the atlas file, `WMH-SynthSeg_v10_231110.pth`,  
to be installed under `$FREESURFER_HOME/models`, and can be downloaded from an ftp
server.

1. **Download the atlas**:
     
  Linux:
  
  ```bash
      wget https://ftp.nmr.mgh.harvard.edu/pub/dist/lcnpublic/dist/WMH-SynthSeg/WMH-SynthSeg_v10_231110.pth 
  ```
  
  
  MacOS:
  
  ```bash
      curl -o WMH-SynthSeg_v10_231110.pth https://ftp.nmr.mgh.harvard.edu/pub/dist/lcnpublic/dist/WMH-SynthSeg/WMH-SynthSeg_v10_231110.pth 
    ```
  
  Installing the atlas (same for both Linux and MacOS):
  ```bash
      cp WMH-SynthSeg/WMH-SynthSeg_v10_231110.pth $FREESURFER_HOME/models
  ```
  
  You should now see `WMH-SynthSeg_v10_231110.pth` under `$FREESURFER_HOME/models`
  This can be confirmed, by running:
  ```bash
      ls $FREESURFER_HOME/models | grep WMH-SynthSeg_v10_231110.pth | wc -l
  ```
  
  The above command should print '1' to the terminal if the model is in the proper
  location.

2. **Run the model**
  
  Run `mri_WMHsynthseg` on the command line, with the appropriate arguments.
  ```
  usage: inference.py [-h] --i I --o O [--csv_vols CSV_VOLS] [--device DEVICE]
                      [--threads THREADS] [--save_lesion_probabilities] [--crop]
  ```

