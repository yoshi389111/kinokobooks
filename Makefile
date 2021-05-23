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

zenn:
	misc/zenn/zenn-create-cover.sh
	misc/zenn/zenn-prog-097-org.sh
	misc/zenn/zenn-prog-097-jpn.sh
	misc/zenn/zenn-soft-097-org.sh
	misc/zenn/zenn-soft-097-jpn.sh
	misc/zenn/zenn-mngr-097-org.sh
	misc/zenn/zenn-mngr-097-jpn.sh
	misc/zenn/zenn-game-097-one.sh
	misc/zenn/zenn-game-097-two.sh
	# misc/zenn/zenn-publish.sh

ogp_images:
	scripts/ogp_images.sh

test-web:
	cd docs ; python3 -m http.server 8000
