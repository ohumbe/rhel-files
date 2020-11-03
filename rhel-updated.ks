#version=RHEL8
ignoredisk --only-use=sda
# System bootloader configuration
bootloader --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --linux --initlabel --drives=sda
# Use text mode install
install
text
# Use CDROM installation media
cdrom
# Keyboard layouts
keyboard --vckeymap=us --xlayouts=''
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=ens2 --ipv6=auto --activate
network  --hostname=rhel82
repo --name="AppStream" --baseurl=file:///run/install/repo/AppStream
# Root password
rootpw --iscrypted $6$cTZIeMaClKaOzxBJ$lgQxIA.vkdnEWtcwnla0rhhkOEBwLwPM1w50ofRW6m5pUhPMYhoF77mAk.klV6khce6Sn9VTffSfOXRPD2Ywq/
# Reboot after setup
reboot
# Run the Setup Agent on first boot
firstboot --enable
# Do not configure the X Window System
skipx
# System services
services --enabled="chronyd"
# System timezone
timezone America/New_York --isUtc

%packages
@^minimal-environment

%end

%addon com_redhat_kdump --disable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

