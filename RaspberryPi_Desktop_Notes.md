•Installing NQC on a virtual machine

**Introduction

Using the Raspberry Pi desktop in a virtual machine allows you to easily use the GUI which makes it much easier to edit your code. You also do not need to buy and set up a physical Raspberry Pi. You do lose the ability to create a stand-alone, always-on machine accesible via ssh for programming you RCX. You pay your money and you make your choice.

I have only tested this procedure on an Intel Apple Mac using Virtual Box. Other host operating systems and virtualisation software may work and I will list these as and when I get the chance to test them. The procedure for installing NQC is essentially the same as for a physical Raspberry Pi but there are a few points to note listed below.

**Virtual Machine Setup

You do not need to allocate a great deal of RAM to the virtual machine. 2GB is fine but, obviously, more is better if you have it.

One processor is all that is needed for the virtual machine but, again, more is better if you have processors to spare.

I have not been able to get shared folders to work with the Raspberry Pi Desktop. I do not know what the problem is as I have other VMs with shared folders. If I find a solution I will post it here.

**Installation

Download the [Raspberry Pi Desktop iso file here...](https://www.raspberrypi.org/software/raspberry-pi-desktop/)

Set up the virtual machine. [Here is a good YouTube tutorial](https://www.youtube.com/watch?v=6xhbCIszykE)

When you plug the USB tower into the host computer the guest OS does not automatically mount the device. Click on the USB icon in the bottom right of the Virtual Box window and select the **Lego® USB IR Tower** option.

Follow the NQC installation procedure as outlined in the main README.md file.

Note that instillation is significantly faster than on a physical Raspberry Pi. It took about 1 min to install on my 2015 Macbook Air as opposed to 10 mins on a Raspberry Pi Zero. Performance in use of the compiler is the same as the limiting factor is the speed of IR communication.

Use of the compiler is exactly the same as for a physical Raspberry Pi but you can use a desktop app to write and edit your code.