#!/bin/bash
sed -i "s/IP/${1}/g" /var/lib/tftpboot/boot-screens/menu.cfg
/usr/sbin/in.tftpd --foreground --user tftp --address 0.0.0.0:69 --secure /var/lib/tftpboot

