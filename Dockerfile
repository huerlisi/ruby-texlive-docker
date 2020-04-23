FROM ruby:2.6.6

# Setup proper UTF-8 locale
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends locales && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
    locale-gen en_US.UTF-8

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends apt-transport-https cmake && \
    gem uninstall bundler && \
    gem install bundler --version 1.17.3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install mdbtools for importers
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends mdbtools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install node and yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update --yes && \
    apt-get install --yes --no-install-recommends nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list && \
    apt-get update --yes && \
    apt-get install --yes --no-install-recommends google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
