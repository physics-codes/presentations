manuscript = ans-winter-2015-sum
references = bibliography
latexopt   = -halt-on-error -file-line-error

all: all-via-pdf

all-via-pdf: $(manuscript).tex $(references).bib
	pdflatex $(latexopt) $(manuscript)
	bibtex $(manuscript).aux
	pdflatex $(latexopt) $(manuscript)
	pdflatex $(latexopt) $(manuscript)

all-via-dvi:
	latex $(latexopt) $(manuscript)
	bibtex $(manuscript).aux
	latex $(latexopt) $(manuscript)
	latex $(latexopt) $(manuscript)
	dvipdf $(manuscript)

clean:
	rm -f *.pdf *.dvi *.toc *.aux *.out *.log *.bbl *.blg *.log *.spl *~ *.spl *.zip

realclean: clean
	rm -rf $(manuscript).dvi
	rm -f $(manuscript).pdf

%.ps :%.eps
	convert $< $@

%.png :%.eps
	convert $< $@

zip:
	zip paper.zip *.tex *.eps *.bib

.PHONY: all clean
