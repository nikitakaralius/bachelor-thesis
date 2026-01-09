.PHONY: pdf

pdf:
	# First LaTeX run
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex
	# Run biber to process bibliography
	- biber --output-directory=./build build/thesis
	# Second LaTeX run to include citations
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex
	# Third LaTeX run to resolve all references
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex
