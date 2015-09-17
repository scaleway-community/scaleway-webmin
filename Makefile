NAME =			virtualmin
VERSION =		latest
VERSION_ALIASES =	
TITLE =			Virtualmin
DESCRIPTION =		Virtualmin
SOURCE_URL =		https://github.com/scaleway/image-app-virtualmin
VENDOR_URL =		http://www.virtualmin.com

IMAGE_VOLUME_SIZE =     50G
IMAGE_BOOTSCRIPT =      stable
IMAGE_NAME =            Virtualmin


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk

