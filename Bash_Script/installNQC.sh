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
sudo -u pi mkdir nqc-3.1.r6
cd nqc-3.1.r6
sudo -u pi wget http://bricxcc.sourceforge.net/nqc/release/nqc-3.1.r6.tgz
sudo -u pi tar xfz nqc-3.1.r6.tgz
cd $homeDirectory

# Apply the USB tower patch
sudo -u pi wget https://sourceforge.net/p/bricxcc/patches/_discuss/thread/00b427dc/b84b/attachment/nqc-01-Linux_usb_and_tcp.diff
sudo -u pi patch -p0 < nqc-01-Linux_usb_and_tcp.diff

# Install Bison & Flex
apt-get install bison flex -y

# Make nqc
cd $homeDirectory/nqc-3.1.r6
make clean
make DEFAULT_USB_NAME='"/dev/usb/legousbtower0"'
chmod 644 nqc-man-2.1r1-0.man
make install

# Download the firmware
sudo -u pi mkdir $homeDirectory/nqc-3.1.r6/firmware
cd $homeDirectory/nqc-3.1.r6/firmware
sudo -u pi wget https://pbrick.info/wp-content/uploads/2013/10/firm0309.zip
sudo -u pi wget https://pbrick.info/wp-content/uploads/2013/10/firm0328.zip
sudo -u pi wget https://pbrick.info/wp-content/uploads/2013/10/firm0332.zip
sudo -u pi wget https://pbrick.info/wp-content/uploads/2013/10/fast0103.zip
sudo -u pi wget https://pbrick.info/wp-content/uploads/2013/10/fast0612.zip
sudo -u pi unzip '*.zip'
rm *.zip

# Make a directory for the code 
cd $homeDirectory
sudo -u pi mkdir nqcCode

# Do some tidying up 
sudo -u pi cp $homeDirectory/nqc-3.1.r6/test.nqc $homeDirectory/nqcCode/
sudo -u pi rm $homeDirectory/nqc-01-Linux_usb_and_tcp.diff

echo "********************"
echo "*                  *"
echo "* Install Complete *"
echo "*                  *"
echo "********************"