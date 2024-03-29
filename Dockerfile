FROM ruby:3.3-alpine

LABEL maintainer="Dmytro Kondratiuk <mrbug404@gmail.com>"

ENV BUNDLER_VERSION=2.0.2
ENV RAILS_ENV=production
ENV APP_HOME=/workspase
# ENV PORT=80

RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    make \
    netcat-openbsd \
    nodejs \
    openssl \
    pkgconfig \
    postgresql-dev \
    python3-gdal \
    python3-mapnik \
    tzdata \
    yarn

# RUN apk info postgresql-client-15


# RUN apk info binutils-gold build-base curl file g++ gcc git less \
#     libstdc++ libffi-dev libc-dev linux-headers libxml2-dev \
#     libxslt-dev libgcrypt-dev make netcat-openbsd nodejs \
#     openssl pkgconfig postgresql-dev tzdata yarn

RUN gem install bundler -v $BUNDLER_VERSION

WORKDIR $APP_HOME

# COPY Gemfile Gemfile.lock $APP_HOME/

# RUN bundle config build.nokogiri --use-system-libraries

# RUN bundle check || bundle install

# COPY package.json yarn.lock $APP_HOME/

# RUN yarn install --check-files

# COPY . $APP_HOME/

COPY scripts /root/initialization_scripts/

CMD ["/bin/bash"]