Author: Robert Glonek, Best Method Limited

This is the Dockerfile and related configuration required to deploy a docker image with the following:
tftpd-hpa server
ubuntu-netinst image
ubuntu preseed and manus for automated installation

This image does NOT contain dhcpd, which must be setup separately.

To build:
# docker build -t tftpd .

To run:
# docker run --rm -it -p 69:69/udp tftpd IP
# docker run --rm -td -p 69:69/udp tftpd IP
where IP is the IP address of the host that is serving the tftpd requests to clients that will be published.

E.g. docker run --rm -td -p 69:69/udp tftpd 192.168.0.111

