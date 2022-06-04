FROM ubuntu:18.04

LABEL maintainer="martin.botka@somainline.org"
LABEL version="0.1"
LABEL description="This is a docker image for building klipper firmware \
for VORON 3D printers."

# Disable the interactivness in apt
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    gcc-arm-none-eabi \
    cmake \
    git \
    python3

COPY FLY-FLYF407ZG.defconfig /FLY-FLYF407ZG
COPY Octopus-STM32F429.defconfig /Octopus-STM32F429
COPY SKR1.34-Turbo.defconfig /SKR1.34-Turbo
COPY SKR1.34-Non-Turbo.defconfig /SKR1.34-Non-Turbo
COPY SKRMiniE3V1.2.defconfig /SKRMiniE3V1.2
COPY SKRMiniE3V1.3.defconfig /SKRMiniE3V1.3
COPY Spider-Octopus-STM32F446.defconfig /Spider-Octopus-STM32F446
COPY build.sh /build.sh

CMD ["./build.sh"]
