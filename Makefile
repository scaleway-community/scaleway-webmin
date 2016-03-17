NAME =			webmin
VERSION =		latest
VERSION_ALIASES =	1.791 1
TITLE =			Webmin
DESCRIPTION =		Webmin
SOURCE_URL =		https://github.com/scaleway-community/scaleway-webmin
VENDOR_URL =		http://www.webmin.com
DEFAULT_IMAGE_ARCH =	x86_64


IMAGE_VOLUME_SIZE =	150G
IMAGE_BOOTSCRIPT =	stable
IMAGE_NAME =		Webmin 1.791


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk

