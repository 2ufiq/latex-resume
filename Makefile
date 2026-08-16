pdf:
	cd resume && xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=Resume_Taufiq resume.tex
	cd resume && xelatex -interaction=nonstopmode -halt-on-error -output-directory=.. -jobname=Resume_Taufiq resume.tex

view: pdf
	xdg-open Resume_Taufiq.pdf

clean:
	rm -f Resume_Taufiq.aux Resume_Taufiq.log Resume_Taufiq.out Resume_Taufiq.pdf

.PHONY: pdf view clean
