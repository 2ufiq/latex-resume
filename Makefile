resume:
	cd resume && TEXINPUTS=..: xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=Resume_Taufiq resume.tex
	cd resume && TEXINPUTS=..: xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=Resume_Taufiq resume.tex

cv:
	cd full-profile && TEXINPUTS=..: xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=CV_Taufiq cv.tex
	cd full-profile && TEXINPUTS=..: xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=CV_Taufiq cv.tex

cv-clean:
	cd clean-profile && TEXINPUTS=..: xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=CV_Taufiqul_Hauqe_Khan cv-clean.tex
	cd clean-profile && TEXINPUTS=..: xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=CV_Taufiqul_Hauqe_Khan cv-clean.tex

view: resume
	xdg-open Resume_Taufiq.pdf

clean:
	rm -f Resume_Taufiq.aux Resume_Taufiq.log Resume_Taufiq.out Resume_Taufiq.pdf
	rm -f CV_Taufiq.aux CV_Taufiq.log CV_Taufiq.out CV_Taufiq.pdf
	rm -f CV_Taufiqul_Hauqe_Khan.aux CV_Taufiqul_Hauqe_Khan.log CV_Taufiqul_Hauqe_Khan.out CV_Taufiqul_Hauqe_Khan.pdf

.PHONY: resume cv cv-clean view clean
