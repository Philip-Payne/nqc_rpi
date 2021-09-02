# nqc_rpi
Installation of NQC for the Lego® RCX on a Raspberry Pi

## Introduction

[Someone has produced](https://minordiscoveries.wordpress.com/2014/01/20/using-nqc-on-a-raspberry-pi-to-program-a-lego-mindstorms-rcx-brick/) a fine set of instructions for setting up NQC on the Raspberry Pi to allow you to compile and download code to the Lego® RCX. While these instructions are very clear there are a number of steps and an error in an early step can cause a problem later on. In order to simplify the process I have created a batch file which will do the following

1. Create the necessary directory structure
2. Install and compile NQC and all dependencies 
3. Download the available firmware files

## Prerequisites

The Bash script assumes that you have used a standard installation of the Raspberry Pi operating system and have not changed the default user name. The code also assumes that you are using the Lego® USB tower, which is reasonable as the Raspberry Pi does not have a serial port.

Comments are placed in the code if you want to make changes based on the above prerequisites.

The Bash script relies on a number of files that are hosted on various web sites which could potentially be down at any given time. I did not create these files and so am reluctant to host copies myself but I have downloaded these files and, if they become unavailable, I will alter the script.

## Installation

### Set up the Raspberry Pi

Follow the standard installation outlined by the Raspberry Pi foundation here…

### Open a terminal and run the following commands

To check that the Lego® Tower drivers are available run

```bash
find /lib/modules -name *lego*
```

You should see a response similar to 

```bash
/lib/modules/5.10.17-v8+/kernel/drivers/usb/misc/legousbtower.ko
/lib/modules/5.10.17+/kernel/drivers/usb/misc/legousbtower.ko
/lib/modules/5.10.17-v7+/kernel/drivers/usb/misc/legousbtower.ko
/lib/modules/5.10.17-v7l+/kernel/drivers/usb/misc/legousbtower.ko
```

Now plug in the USB Tower. Note that on my Raspberry Pi 3B some USB ports did not seem to recognise the tower so be prepared to try more than once.

In the terminal run

```bash
ls -l /dev/usb
```

And you should get a response similar to

```bash
crw-rw-rw- 1 root root 180, 160 Aug 29 16:03 legousbtower0
```

Assuming the above has worked you can now download and run the Bash script

```bash
cd
wget https://raw.githubusercontent.com/Philip-Payne/nqc_rpi/main/Bash_Script/installNQC.sh
sudo bash ./installNQC.sh
```

The process will take some time to run (about x mins on my Raspberry Pi Zero) and you will see the following message when it completes.

```bash
# some message
```

You should now have an installed and functioning copy of NQC and a firmware directory containing all the various firmware versions that are available.

To download the mos recent Lego® firmware to your RCX turn on your RCX and place it close to the USB tower with the transparent window of the RCX facing the tower and run the following command.

```bash
nqc -Susb:/dev/usb/legousbtower0 -firmware /home/pi/nqc-3.1.r6/firmware/firm0332.lgo
```

To download a program to the RCX use

```bash
nqc -Susb:/dev/usb/legousbtower0 -d /home/pi/nqcCode/test.nqc
```

More details of the NQC compiler can be found by running

```bash
nqc -help
```
