#!/bin/bash
# Simple script to compile the LaTeX, and then use ImageMagick to screenshot 
pdflatex resume.tex

convert -density 300 resume.pdf[0] -gamma 1.2 resume.png
