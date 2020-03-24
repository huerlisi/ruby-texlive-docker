FROM ruby:2.6.5

# Setup additional package sources
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install packages
RUN apt-get update --yes \
  && apt-get install --yes --no-install-recommends apt-transport-https cmake google-chrome-stable locales mdbtools nodejs yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Setup proper UTF-8 locale
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment \
  && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
  && echo "LANG=en_US.UTF-8" > /etc/locale.conf \
  && locale-gen en_US.UTF-8

RUN gem uninstall bundler \
  && gem update --system --no-document \
  && gem install bundler --version 1.17.3 --no-document \
  && gem cleanup all
