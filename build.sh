#!/bin/bash

boards=("FLY-FLYF407ZG" "Octopus-STM32F429" "SKR1.34-Turbo" "SKR1.34-Non-Turbo" "SKRMiniE3V1.2" "SKRMiniE3V1.3" "Spider-Octopus-STM32F446")

git clone https://github.com/Klipper3d/klipper.git

for board in "${boards[@]}"
do
	cd klipper
	echo "Copying new config"
	cp ../$board .config
	echo "Compiling klipper for $board"
	make KCONFIG_CONFIG=../$board
	echo "Cleaning up the mess we did"
	# Distclean removes also the .config files for us
	make distclean
	cd ..
	# This is an directory mounted from the host system
	echo "Copying built image to output directory"
	cp klipper/out/klipper.bin /out/$board-firmware.bin
done
