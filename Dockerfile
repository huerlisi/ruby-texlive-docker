FROM ruby:2.3

RUN apt-get update --yes ;\
    apt-get install --yes texlive texlive-lang-german texlive-fonts-extra texlive-latex-extra pdftk ghostscript ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*
