pdf:
	xelatex -interaction=nonstopmode -halt-on-error resume.tex
	xelatex -interaction=nonstopmode -halt-on-error resume.tex

view: pdf
	xdg-open resume.pdf

clean:
	rm -f resume.aux resume.log resume.out resume.pdf

.PHONY: pdf view clean
