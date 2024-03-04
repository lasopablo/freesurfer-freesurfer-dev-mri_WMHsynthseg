# mri_WMHsynthseg

This README documents how to download and install the atlas file required by the
mri_WMHsynthseg utility. General usage and utility description can be found at:
    
    https://surfer.nmr.mgh.harvard.edu/fswiki/WMH-SynthSeg

This utility requires an atlas file that does not ship with the standard install
of FreeSurfer. This is done in an effort to keep the size of the installer
reasonable. The utility expects the atlas file, `WMH-SynthSeg_v10_231110.pth`,  
to be installed under `$FREESURFER_HOME/models`, and can be downloaded from an ftp
server.

## Downloading the atlas:
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

## Create an environment 
We highly recommend create an environment for deveoplment purposes:
```bash
conda create --name pytorch python=3.7
conda activate pytorch
conda install pytorch==1.7.0 torchvision torchaudio cudatoolkit=11.0 -c pytorch*
```

## Run the model

Run `mri_WMHsynthseg` on the command line, with the appropiate arguments.

