tftpboot_dir="/var/lib/tftpboot"
wget http://archive.ubuntu.com/ubuntu/ubuntu/dists/xenial/main/installer-amd64/current/images/netboot/netboot.tar.gz -O ubuntu-16.04-netboot.tar.gz && \
mkdir ubuntu-16.04-netboot && \
tar zxf ubuntu-16.04-netboot.tar.gz -C ubuntu-16.04-netboot && \
cp -a ubuntu-16.04-netboot/ubuntu-installer ${tftpboot_dir} && \
cp ubuntu-16.04-netboot/ubuntu-installer/amd64/pxelinux.0 ${tftpboot_dir}/ && \
cp ubuntu-16.04-netboot/ubuntu-installer/amd64/boot-screens/ldlinux.c32 ${tftpboot_dir}/ && \
mkdir ${tftpboot_dir}/boot-screens && \
cp ubuntu-16.04-netboot/ubuntu-installer/amd64/boot-screens/libcom32.c32 ${tftpboot_dir}/boot-screens && \
cp ubuntu-16.04-netboot/ubuntu-installer/amd64/boot-screens/libutil.c32 ${tftpboot_dir}/boot-screens && \
cp ubuntu-16.04-netboot/ubuntu-installer/amd64/boot-screens/vesamenu.c32 ${tftpboot_dir}/boot-screens && \
mkdir ${tftpboot_dir}/pxelinux.cfg && \
rm -rf ubuntu-16.04-netboot.tar.gz ubuntu-16.04-netboot && \
cd ${tftpboot_dir}/pxelinux.cfg && \
ln -s ../boot-screens/syslinux.cfg default && \
sed -i 's/TFTP_ADDRESS="\[::\]:69"/TFTP_ADDRESS="0.0.0.0:69"/g' /etc/default/tftpd-hpa

