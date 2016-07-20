FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /pocket_waiter
WORKDIR /pocket_waiter
ADD Gemfile /pocket_waiter/Gemfile
ADD Gemfile.lock /pocket_waiter/Gemfile.lock
RUN bundle install
ADD . /pocket_waiter
