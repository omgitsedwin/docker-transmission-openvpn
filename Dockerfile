FROM lsiobase/alpine
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache \
	curl \
	jq \
	transmission-cli \
	transmission-daemon \
	openvpn

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 9091 51413 1194/udp
VOLUME /config /downloads /watch /etc/openvpn
