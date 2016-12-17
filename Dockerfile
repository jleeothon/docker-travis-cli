FROM ruby:2.2.6-alpine

MAINTAINER Johnny Lee-Othon <jleeothon@gmail.com>
LABEL version=1.8.5

COPY . /root
RUN apk --update add --virtual build_deps sudo build-base ruby-dev libc-dev linux-headers openssl-dev postgresql-dev libxml2-dev libxslt-dev libffi-dev \
    && cd /root \
    && bundle install --gemfile=/root/Gemfile && >&2 cat Gemfile.lock \
    && rm -rf /root/.bundle \
    && rm -rf /root/.gem \
    && apk del build_deps

ENTRYPOINT ["sh"]
