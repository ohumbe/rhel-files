#version=RHEL8
ignoredisk --only-use=sda
autopart --type=lvm
# Partition clearing information
clearpart --all --initlabel
# Use text install
install
text
# Use CDROM installation media
cdrom
# Added - specify mbr bootloader
bootloader --location=mbr
zerombr
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=static --device=ens3 --gateway=192.168.122.1 --ip=192.168.122.184 --netmask=255.255.254.0 --ipv6=auto --activate
network  --hostname=ansible0
repo --name="AppStream" --baseurl=file:///run/install/repo/AppStream
# Root password
rootpw --iscrypted $6$J.qkOEOhqp2McOOF$KWmS0BxghFAIKzt.vuZfqzf7V7tWxtyXeArsZ0pac.BTAvfz7mF7ovwF7FVQR1cIzE/DbfjIlvhses5FdV6Tm.
# Reboots system after installation (I think)
reboot
# Run the Setup Agent on first boot
firstboot --disable
# Do not configure the X Window System
skipx
# System services
services --enabled="chronyd"
# System timezone
timezone America/Los_Angeles --isUtc

%packages
@^minimal-environment

%end
