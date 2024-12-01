#!/bin/bash

# Compile the LaTeX file to PDF
pdflatex resume.tex

# Convert the first page of the PDF to an image
convert -density 300 resume.pdf[0] resume.png
