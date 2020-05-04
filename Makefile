EPUBS=epub/prog97.epub epub/soft97.epub epub/mngr97.epub epub/game197.epub epub/game297.epub

all: $(EPUBS)

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
