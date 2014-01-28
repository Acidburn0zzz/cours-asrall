PANDOC=pandoc --template=asrall.latex -V papersize=a4paper -V documentclass=article
WIKI=wiki
BT=bugtracker
RT=requesttracker
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
		-V title-meta="[Correction] Séance n°2 : BugTracker"
rt:
	$(PANDOC) $(RT).md -o $(RT).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="Séance n°3 : BugTracker"
	$(PANDOC) $(RT)_correction.md -o $(RT)_correction.pdf \
		-V title-meta="[Correction] Séance n°3 : BugTracker"
forge:
	$(PANDOC) $(FORGE).md -o $(FORGE).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="Séance n°4 : BugTracker"
	$(PANDOC) $(FORGE)_correction.md -o $(FORGE)_correction.pdf \
		-V title-meta="[Correction] Séance n°4 : BugTracker"
cms:
	$(PANDOC) $(CMS).md -o $(CMS).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="Séance n°5 : BugTracker"
	$(PANDOC) $(CMS)_correction.md -o $(CMS)_correction.pdf \
		-V title-meta="[Correction] Séance n°5 : BugTracker"
glpi:
	$(PANDOC) $(GLPI).md -o $(GLPI).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="Séance n°6 : BugTracker"
	$(PANDOC) $(GLPI)_correction.md -o $(GLPI)_correction.pdf \
		-V title-meta="[Correction] Séance n°6 : BugTracker"
