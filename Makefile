NAME =			webmin
VERSION =		latest
VERSION_ALIASES =	
TITLE =			Webmin
DESCRIPTION =		Webmin
SOURCE_URL =		https://github.com/scaleway/image-app-webmin
VENDOR_URL =		http://www.webmin.com

IMAGE_VOLUME_SIZE =     150G
IMAGE_BOOTSCRIPT =      stable
IMAGE_NAME =            Webmin


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk

