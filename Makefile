PANDOC=pandoc --template=asrall.latex -V papersize=a4paper -V documentclass=article
WIKI=wiki
BT=bugtracker
TT=tickettracker
FORGE=forge
CMS=cms
GLPI=gestiondeparc
AUTHOR_META="Luc Didry"

all: wiki bt tt forge cms glpi

wiki:
	$(PANDOC) $(WIKI).md -o $(WIKI).pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="Séance n°1 : Wiki" \
		-V title="Séance n°1 : Wiki" \
		-V quote="Lourd est le parpaing de la réalité sur la tartelette aux fraises de nos illusions" \
		-V quoteauthor="Boulet"
	$(PANDOC) $(WIKI)_correction.md -o $(WIKI)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="[Correction] Séance n°1 : Wiki"
bt:
	$(PANDOC) $(BT).md -o $(BT).pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="Séance n°2 : BugTracker" \
		-V title="Séance n°2 : BugTracker" \
		-V quote="Exterminate!" \
		-V quoteauthor="Les Daleks"
	$(PANDOC) $(BT)_correction.md -o $(BT)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="[Correction] Séance n°2 : BugTracker" \
tt:
	$(PANDOC) $(TT).md -o $(TT).pdf
forge:
	$(PANDOC) $(FORGE).md -o $(FORGE).pdf
cms:
	$(PANDOC) $(CMS).md -o $(CMS).pdf
glpi:
	$(PANDOC) $(GLPI).md -o $(GLPI).pdf
