# VORON-Firmware-Builder
A repositary to hold the Dockerfile and scripts, configs used to build the VORON firmware images

## How to use
Please have docker preconfigured and ready.
Build the docker image by
```
docker build -t voron-image .
```

After the image is built you can run it by issuing command

```
sudo docker run -d -v <Absolute path to directory you want the images to be copied to>:/out voron-image:latest
```

or for single board builds

```
sudo docker run -d -v <Absolute path to directory you want the images to be copied to>:/out -e BOARD=<name of the board you wish to build> voron-image:latest
```

There is also an optional enviroment variable you can pass to the docker image
OUTPUT_NAME that allows you to set the output name.
Filename when building for SKR1.3 and OUTPUT_NAME set to "June-5th"
will be "SKR1.34-Non-Turbo-June-5th.bin"

After which you should see the precompiled images in the directory you specified.
