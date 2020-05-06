all: books web ogp_images

books:
	scripts/prog97.sh
	scripts/soft97.sh
	scripts/mngr97.sh
	scripts/game197.sh
	scripts/game297.sh

web:
	scripts/prog97_htm.sh
	scripts/soft97_htm.sh
	scripts/mngr97_htm.sh
	scripts/game197_htm.sh
	scripts/game297_htm.sh

ogp_images:
	scripts/ogp_images.sh
