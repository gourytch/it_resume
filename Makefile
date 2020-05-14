.PHONY: all clean zip

DIRNAME := $(shell basename $(CURDIR))

all: resume-lvbabchenko-developer-ru.pdf resume-lvbabchenko-developer.pdf
#	resume-lvbabchenko-developer.pdf resume-lvbabchenko-developer-ru.pdf \
#	resume-lvbabchenko-4rocket-ru.pdf resume-lvbabchenko-4rocket.pdf
#	 resume-leiderman.pdf

%.pdf: %.tex
	pdflatex $<

#%.pdf: %.dvi
#	dvipdft $^

#%.dvi: %.tex
#	latex $^

zip:: clean
	cd .. && \
	zip -r $(DIRNAME).zip $(DIRNAME)/ && \
	cp $(DIRNAME).zip $(DIRNAME)/$(DIRNAME).zip && \
	cd $(DIRNAME)


clean:
	$(RM) -f *.aux *.out *.log *.dvi *.pdf *.zip *~


