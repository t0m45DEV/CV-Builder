.PHONY = all clean

LANG_SPANISH = es
LANG_ENGLISH = en

MODE_DEV       = dev
MODE_GAMEDEV   = game-dev
MODE_PROFESSOR = prof

LATEX = pdflatex
TEX = cv.tex
CV_FILE = display_cv.tex

PDF_FOLDER = pdf

CURR_LANGUAGE = $(LANG_ENGLISH)
CURR_MODE = $(MODE_DEV)

PDF = cv-$(CURR_MODE)-$(CURR_LANGUAGE)

define DISPLAY_CV_CONTENT
\input{info/$(CURR_LANGUAGE)/utils}
\input{info/$(CURR_LANGUAGE)/about_me}
\input{info/$(CURR_LANGUAGE)/education}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/experience}
\input{info/$(CURR_LANGUAGE)/languages}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/skills}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/portfolio}
endef

export DISPLAY_CV_CONTENT


$(PDF) : $(TEX)
	echo "$$DISPLAY_CV_CONTENT" > $(CV_FILE)
	$(LATEX) -jobname=$(PDF) $<
	mkdir -p $(PDF_FOLDER)
	cp $(PDF).pdf $(PDF_FOLDER)

all:
	$(MAKE) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_DEV)
	$(MAKE) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_GAMEDEV)

clean:
	@rm -f *.log *.pdf *.aux *.vrb
