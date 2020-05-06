EPUBS=epub/prog97.epub epub/soft97.epub epub/mngr97.epub epub/game197.epub epub/game297.epub

all: $(EPUBS)

web:
	scripts/prog97_htm.sh
	scripts/soft97_htm.sh
	scripts/mngr97_htm.sh
	scripts/game197_htm.sh
	scripts/game297_htm.sh

ogp_images:
	scripts/ogp_images.sh

clean:
	rm -f $(EPUBS)

epub/prog97.epub:
	scripts/prog97.sh

epub/soft97.epub:
	scripts/soft97.sh

epub/mngr97.epub:
	scripts/mngr97.sh

epub/game197.epub:
	scripts/game197.sh

epub/game297.epub:
	scripts/game297.sh
