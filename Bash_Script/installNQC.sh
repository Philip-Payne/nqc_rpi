#!bin/bash

# Set the home directory
homeDirectory="/home/pi"

# The permissions string
permissions="ATTRS{idVendor}==\"0694\",ATTRS{idProduct}==\"0001\",MODE=\"0666\",GROUP=\"lego\""

# Create and add the permissions file
echo $permissions > /etc/udev/rules.d/90-legotower.rules

# Create a group and add the pi user
groupadd lego
usermod -a -G lego pi

# Download NQC
cd $homeDirectory
mkdir nqc-3.1.r6
cd nqc-3.1.r6
wget http://bricxcc.sourceforge.net/nqc/release/nqc-3.1.r6.tgz
tar xfz nqc-3.1.r6.tgz
cd $homeDirectory

# Apply the USB tower patch
wget https://sourceforge.net/p/bricxcc/patches/_discuss/thread/00b427dc/b84b/attachment/nqc-01-Linux_usb_and_tcp.diff
patch -p0 < nqc-01-Linux_usb_and_tcp.diff

# Install Bison & Flex
apt-get install bison flex -y

# Make nqc
cd $homeDirectory/nqc-3.1.r6
make clean
make DEFAULT_USB_NAME='"/dev/usb/legousbtower0"'
chmod 644 nqc-man-2.1r1-0.man
sudo make install

# Download the firmware
mkdir $homeDirectory/nqc-3.1.r6/firmware
cd $homeDirectory/nqc-3.1.r6/firmware
wget https://pbrick.info/wp-content/uploads/2013/10/firm0309.zip
wget https://pbrick.info/wp-content/uploads/2013/10/firm0328.zip
wget https://pbrick.info/wp-content/uploads/2013/10/firm0332.zip
wget https://pbrick.info/wp-content/uploads/2013/10/fast0103.zip
wget https://pbrick.info/wp-content/uploads/2013/10/fast0612.zip
unzip '*.zip'
rm *.zip

cd $homeDirectory
mkdir nqcCode

echo "********************"
echo "*                  *"
echo "* Install Complete *"
echo "*                  *"
echo "********************"