#!/bin/bash
pdflatex -interaction=nonstopmode ./diszkret-matematika-feladatok.tex
biber diszkret-matematika-feladatok
pdflatex -interaction=nonstopmode ./diszkret-matematika-feladatok.tex
exit 0
