#!/bin/bash

# Set the IP address of the PXE server
PXE_SERVER_IP="192.168.1.100"

# Set the name of the boot image file
BOOT_IMAGE="bootimage.iso"

# Download the boot image from the PXE server
wget "http://${PXE_SERVER_IP}/${BOOT_IMAGE}" -O /tmp/${BOOT_IMAGE}

# Mount the boot image as a loop device
mkdir /tmp/mnt
mount -o loop /tmp/${BOOT_IMAGE} /tmp/mnt

# Change the boot order to network boot first
efibootmgr -o 0000,FFFF

# Reboot the system to start the network boot process
reboot
