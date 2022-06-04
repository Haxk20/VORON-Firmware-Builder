# VORON-Firmware-Builder
A repositary to hold the Dockerfile and scripts, configs used to build the VORON firmware images

##How to use
Please have docker preconfigured and ready.
Build the docker image by
```
docker build -t voron-image .
```

After the image is built you can run it by issuing command
```
sudo docker run -d -v <Absolute path to directory you want the images to be coppied to>:/out voron-image:latest
```

After which you should see the precompiled images in the directory you specified.
