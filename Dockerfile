FROM ruby:2.3

RUN apt-get update --yes
RUN apt-get install --yes texlive texlive-lang-german texlive-fonts-extra texlive-latex-extra pdftk ghostscript
