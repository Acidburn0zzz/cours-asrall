PANDOC=pandoc --template=asrall.latex -V papersize=a4paper -V documentclass=article
WIKI=01.wiki
BT=02.bugtracker
TT=03.tickettracker
FORGE=04.forge
CMS=05.cms
GLPI=06.gestiondeparc

all: wiki bt tt forge cms glpi

wiki:
	$(PANDOC) $(WIKI).md -o $(WIKI).pdf
bt:
	$(PANDOC) $(BT).md -o $(BT).pdf
tt:
	$(PANDOC) $(TT).md -o $(TT).pdf
forge:
	$(PANDOC) $(FORGE).md -o $(FORGE).pdf
cms:
	$(PANDOC) $(CMS).md -o $(CMS).pdf
glpi:
	$(PANDOC) $(GLPI).md -o $(GLPI).pdf
