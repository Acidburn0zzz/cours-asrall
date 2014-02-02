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
		-V title="Séance n°1 : Wiki" \
		-V title-meta="Séance n°1 : Wiki" \
		-V quote="Lourd est le parpaing de la réalité sur la tartelette aux fraises de nos illusions" \
		-V quoteauthor="Boulet"
	$(PANDOC) $(WIKI)_correction.md -o $(WIKI)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="[Correction] Séance n°1 : Wiki" \
		-V title-meta="[Correction] Séance n°1 : Wiki"
bt:
	$(PANDOC) $(BT).md -o $(BT).pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="Séance n°2 : BugTracker" \
		-V title-meta="Séance n°2 : BugTracker" \
		-V quote="Exterminate!" \
		-V quoteauthor="Les Daleks"
	$(PANDOC) $(BT)_correction.md -o $(BT)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="[Correction] Séance n°2 : BugTracker" \
		-V title-meta="[Correction] Séance n°2 : BugTracker"
rt:
	$(PANDOC) $(RT).md -o $(RT).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title="Séance n°3 : Centre d'assistance"
		-V title-meta="Séance n°3 : Centre d'assistance"
	$(PANDOC) $(RT)_correction.md -o $(RT)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="[Correction] Séance n°3 : Centre d'assistance" \
		-V title-meta="[Correction] Séance n°3 : Centre d'assistance"
forge:
	$(PANDOC) $(FORGE).md -o $(FORGE).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title="Séance n°4 : Forge logicielle"
		-V title-meta="Séance n°4 : Forge logicielle"
	$(PANDOC) $(FORGE)_correction.md -o $(FORGE)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="[Correction] Séance n°4 : Forge logicielle" \
		-V title-meta="[Correction] Séance n°4 : Forge logicielle"
cms:
	$(PANDOC) $(CMS).md -o $(CMS).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title-meta="Séance n°5 : Système de gestion de contenu"
		-V title="Séance n°5 : Système de gestion de contenu"
	$(PANDOC) $(CMS)_correction.md -o $(CMS)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="[Correction] Séance n°5 : Système de gestion de contenu" \
		-V title-meta="[Correction] Séance n°5 : Système de gestion de contenu"
glpi:
	$(PANDOC) $(GLPI).md -o $(GLPI).pdf
		-V author-meta=$(AUTHOR_META) \
		-V title="Séance n°6 : Gestion libre de parc informatique"
		-V title-meta="Séance n°6 : Gestion libre de parc informatique"
	$(PANDOC) $(GLPI)_correction.md -o $(GLPI)_correction.pdf \
		-V author-meta=$(AUTHOR_META) \
		-V title="[Correction] Séance n°6 : Gestion libre de parc informatique" \
		-V title-meta="[Correction] Séance n°6 : Gestion libre de parc informatique"
