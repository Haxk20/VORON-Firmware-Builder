#!/bin/bash

boards=("FLY-FLYF407ZG" "Octopus-STM32F429" "SKR1.34-Turbo" "SKR1.34-Non-Turbo" "SKRMiniE3V1.2" "SKRMiniE3V1.3" "Spider-Octopus-STM32F446")

git clone https://github.com/Klipper3d/klipper.git

if [ -z "$BOARD" ]
then
	for board in "${boards[@]}"
	do
		cd klipper
		echo "Copying new config"
		cp ../$board .config
		echo "Compiling klipper for $board"
		make KCONFIG_CONFIG=../$board
		if [ $? -eq 0 ]
		then
			# This is an directory mounted from the host system
			echo "Copying built image to output directory"
			cp out/klipper.bin /out/$board-firmware.bin
			echo "Cleaning up the mess we did"
			# Distclean removes also the .config files for us
			make distclean
			cd ..
		else
			echo "Build for board $board failed. Doing distclean and continuing"
			make distclean
		fi
	done
else
	if [[ " ${boards[*]} " == *" $BOARD "* ]]; then
		cd klipper
		echo "Copying new config"
		cp ../$BOARD .config
		echo "Compiling klipper for $BOARD"
		make KCONFIG_CONFIG=../$BOARD
		if [ $? -eq 0 ]
		then
			# This is an directory mounted from the host system
			echo "Copying built image to output directory"
			cp out/klipper.bin /out/$BOARD-firmware.bin
			echo "Cleaning up the mess we did"
			# Distclean removes also the .config files for us
			make distclean
			cd ..
		else
			echo "Build for board $BOARD failed. Doing distclean and exiting"
			make distclean
			exit 1
		fi
	else
		echo "$BOARD is not a recognized board. Please check that the enviroment variable BOARD is one of the following:"
		for board in "${boards[@]}"
		do
			echo "$board"
		done
		exit 1
	fi
fi
