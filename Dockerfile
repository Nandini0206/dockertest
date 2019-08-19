
#generates a Gemfile.lock if there is not already one

FROM ruby:2.5

# RUN bundle config --global frozen 1
RUN gem install bundler

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["ruby", "./lib/run.rb"]
