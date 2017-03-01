### docker build -t tftpd .
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install tftpd-hpa wget && rm -rf /var/cache/apt/archives/*
ADD configurePxe.sh /
RUN chmod 755 /configurePxe.sh && /configurePxe.sh
ADD syslinux.cfg /var/lib/tftpboot/boot-screens/
ADD menu.cfg /var/lib/tftpboot/boot-screens/
RUN mkdir /var/lib/tftpboot/preseed
ADD ubuntu-16.04-preseed.cfg /var/lib/tftpboot/preseed/
ADD runtftpd.sh /
RUN chmod 755 /runtftpd.sh
EXPOSE 69/udp
### docker run --rm -it -p 69:69/udp tftpd
### docker run --rm -td -p 69:69/udp tftpd
ENTRYPOINT ["/runtftpd.sh"]
