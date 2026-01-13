.PHONY: pdf refs

pdf:
	# First LaTeX run
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex
	# Run biber to process bibliography
	- biber --output-directory=./build build/thesis
	# Second LaTeX run to include citations
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex
	# Third LaTeX run to resolve all references
	- pdflatex -output-directory=./build -interaction=nonstopmode thesis.tex

refs:
	mkdir -p refs/text
	@for pdf in refs/pdf/*.pdf; do \
		if [ -f "$$pdf" ]; then \
			echo "Converting $$pdf..."; \
			pdftotext "$$pdf" "refs/text/$$(basename "$$pdf" .pdf).txt"; \
		fi; \
	done
	@echo "PDF extraction complete. Text files are in refs/text/"
