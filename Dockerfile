FROM ruby:2.6

# Install node and yarn
RUN apt-get update -yqq \
  && apt-get install -yqq apt-transport-https \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash -  \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -  \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list  \
  && apt-get update -y  \
  && apt-get install -y nodejs yarn  \
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*

# Install TeX Live
RUN apt-get update --yes  \
  && apt-get install --yes texlive texlive-lang-german texlive-fonts-extra texlive-latex-extra pdftk ghostscript  \
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list  \
  && apt-get update --yes  \
  && apt-get install --yes google-chrome-stable  \
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*

# Install mdbtools for importers
RUN apt-get update --yes  \
  && apt-get install --yes mdbtools  \
  && apt-get clean  \
  && rm -rf /var/lib/apt/lists/*
