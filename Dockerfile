FROM ruby:2.6

# Install node and yarn
RUN apt-get update -yqq \
  && apt-get install -yqq apt-transport-https \
  && curl -sL "https://deb.nodesource.com/setup_8.x" | bash -  \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -  \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list  \
  && apt-get update -y  \
  && apt-get install -y --no-install-recommends nodejs yarn  \
  # preinstall correct bundler version
  && gem uninstall --all bundler \
  && gem install bundler --version 1.17.3 -N  \
  # apt cleanup
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*

# install latex layer
RUN apt-get update -y  \
  && apt-get install -y --no-install-recommends \
               pdftk \
               ghostscript  \
               # needed recommends of ghostscript
               gsfonts libpaper-utils  \
               # texlive main
               texlive \
               texlive-lang-german \
               texlive-fonts-extra \
               texlive-latex-extra \
               # needed recommends of texlive
               texlive-binaries \
               texlive-pstricks \
               texlive-font-utils \
               tex-gyre lmodern \
               fonts-lato fonts-lmodern fonts-texgyre fonts-dejavu-extra fonts-freefont-otf fonts-freefont-ttf fonts-junicode fonts-noto-hinted fonts-texgyre fonts-ebgaramond fonts-sil-gentium fonts-sil-gentiumplus fonts-stix fonts-droid-fallback fonts-noto-mono \
               libcupsfilters1 libcupsimage2 libfontenc1  \
               zip ps2eps prosper \
  # apt cleanup
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*

# Install mdbtools for importers
RUN apt-get update -yqq  \
  && apt-get install -yqq --no-install-recommends mdbtools  \
  # apt cleanup
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list  \
  && apt-get update -yqq  \
  && apt-get install -yqq --no-install-recommends google-chrome-stable  \
  # apt cleanup
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*
