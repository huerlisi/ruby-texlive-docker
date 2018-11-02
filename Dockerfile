FROM ruby:2.3

RUN apt-get update --yes ;\
    apt-get --yes install apt-transport-https ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*

# Install node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - ;\
    apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - ;\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list ;\
    apt-get update --yes ;\
    apt-get install --yes yarn ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*

# Install TeX Live
RUN apt-get update --yes ;\
    apt-get install --yes texlive texlive-lang-german texlive-fonts-extra texlive-latex-extra pdftk ghostscript ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - ;\
    echo "deb https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list ;\
    apt-get update --yes ;\
    apt-get install --yes google-chrome-stable ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/*

