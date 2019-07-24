FROM ruby:2.6-stretch

RUN apt-get update --yes && \
    apt-get --yes install apt-transport-https && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install node and yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update --yes && \
    apt-get install --yes nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install TeX Live
RUN apt-get update --yes && \
    apt-get install --yes texlive texlive-lang-german texlive-fonts-extra texlive-latex-extra pdftk ghostscript && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list && \
    apt-get update --yes && \
    apt-get install --yes google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install mdbtools for importers
RUN apt-get update --yes && \
    apt-get install --yes mdbtools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
