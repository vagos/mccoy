SHELL := /bin/bash

LATEXMK := latexmk
LATEXMK_OPTS := -pdfxe

TEX_SRC := draft.tex
PDF := $(TEX_SRC:.tex=.pdf)

IMG_FILES := $(wildcard assets/*)

.PHONY: all clean distclean view

all: $(PDF)

$(PDF): $(TEX_SRC) bib.bib $(IMG_FILES)
	$(LATEXMK) $(LATEXMK_OPTS) $(TEX_SRC)

clean:
	$(LATEXMK) -c
	rm -f $(PDF) *.aux *.bbl *.blg *.log *.out *.toc *.fls *.fdb_latexmk

distclean:
	$(LATEXMK) -C

view: all
	open $(PDF)
