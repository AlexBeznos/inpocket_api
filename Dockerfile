FROM ruby:2.3.1

ENV app /pocket_waiter
ENV PORT 3000
ENV RAILS_ENV development

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir $app
WORKDIR $app
RUN gem install bundler
ENV BUNDLE_PATH /bundle

WORKDIR $app
COPY . ./
