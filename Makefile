.PHONY = all clean

LANG_SPANISH = es
LANG_ENGLISH = en

MODE_DEV       = dev
MODE_GAMEDEV   = game-dev
MODE_PROFESSOR = prof

CV_STL_HARVARD = harvard
CV_STL_COLOR = color

CURR_LANGUAGE = $(LANG_ENGLISH)
CURR_MODE = $(MODE_DEV)
CURR_CV_STL = $(CV_STL_HARVARD)

LATEX = pdflatex
TEX = cv-$(CURR_CV_STL).tex
CV_FILE = display_cv.tex
CV_TITLE_FILE = cv_curr_title.tex

CV_COLOR_COL_FILE = cv-$(CV_STL_COLOR)-column.tex
CV_COLOR_COL_BOT_FILE = cv-$(CV_STL_COLOR)-column-bottom.tex
CV_COLOR_COL_SIDE_FILE = cv-$(CV_STL_COLOR)-column-side.tex

PDF_FOLDER = pdf

PDF = cv-$(CURR_MODE)-$(CURR_LANGUAGE)-$(CURR_CV_STL)

define DISPLAY_CV_CONTENT
\input{info/$(CURR_LANGUAGE)/utils}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/about_me}
\input{info/$(CURR_LANGUAGE)/education}
\input{info/$(CURR_LANGUAGE)/experience}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/portfolio}
\\begin{multicols}{2}
	\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/skills}
	\input{info/$(CURR_LANGUAGE)/languages}
\\end{multicols}
endef

define CV_TITLE
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/cv_title}
\\cvTitle
endef

define CV_COLOR_COL
\input{info/$(CURR_LANGUAGE)/utils}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/about_me}
\\titleForContact
\\contactInfo
\input{info/$(CURR_LANGUAGE)/languages}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/skills}
endef

define CV_COLOR_COL_SIDE
\input{info/$(CURR_LANGUAGE)/utils}
\input{info/$(CURR_LANGUAGE)/experience}
\input{info/$(CURR_LANGUAGE)/$(CURR_MODE)/portfolio}
endef

define CV_COLOR_COL_BOT
\input{info/$(CURR_LANGUAGE)/utils}
\input{info/$(CURR_LANGUAGE)/education}
endef

export DISPLAY_CV_CONTENT
export CV_TITLE
export CV_COLOR_COL
export CV_COLOR_COL_SIDE
export CV_COLOR_COL_BOT


$(PDF) : $(TEX)
	@echo "$$DISPLAY_CV_CONTENT" > $(CV_FILE)
	@echo "$$CV_TITLE" > $(CV_TITLE_FILE)
	@echo "$$CV_COLOR_COL" > $(CV_COLOR_COL_FILE)
	@echo "$$CV_COLOR_COL_SIDE" > $(CV_COLOR_COL_SIDE_FILE)
	@echo "$$CV_COLOR_COL_BOT" > $(CV_COLOR_COL_BOT_FILE)
	@$(LATEX) -jobname=$(PDF) $<
	@mkdir -p $(PDF_FOLDER)
	@mv $(PDF).pdf $(PDF_FOLDER)

all:
	@$(MAKE) CURR_CV_STL=$(CV_STL_HARVARD) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_DEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_HARVARD) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_GAMEDEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_HARVARD) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_PROFESSOR)

	@$(MAKE) CURR_CV_STL=$(CV_STL_HARVARD) CURR_LANGUAGE=$(LANG_SPANISH) CURR_MODE=$(MODE_DEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_HARVARD) CURR_LANGUAGE=$(LANG_SPANISH) CURR_MODE=$(MODE_GAMEDEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_HARVARD) CURR_LANGUAGE=$(LANG_SPANISH) CURR_MODE=$(MODE_PROFESSOR)

	@$(MAKE) CURR_CV_STL=$(CV_STL_COLOR) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_DEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_COLOR) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_GAMEDEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_COLOR) CURR_LANGUAGE=$(LANG_ENGLISH) CURR_MODE=$(MODE_PROFESSOR)

	@$(MAKE) CURR_CV_STL=$(CV_STL_COLOR) CURR_LANGUAGE=$(LANG_SPANISH) CURR_MODE=$(MODE_DEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_COLOR) CURR_LANGUAGE=$(LANG_SPANISH) CURR_MODE=$(MODE_GAMEDEV)
	@$(MAKE) CURR_CV_STL=$(CV_STL_COLOR) CURR_LANGUAGE=$(LANG_SPANISH) CURR_MODE=$(MODE_PROFESSOR)


openall:
	@for file in $(PDF_FOLDER)/*.pdf ; do \
		open "$${file}" ; \
	done


clean:
	@rm -f *.log *.pdf *.aux *.vrb

cleanall: clean
	@rm -f $(PDF_FOLDER)/*
