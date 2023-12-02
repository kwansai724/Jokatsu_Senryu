FROM ruby:3.2.2

RUN apt-get update && \
    apt-get install -y nodejs --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

ARG WORKDIR

RUN mkdir /${WORKDIR}
WORKDIR /${WORKDIR}
COPY Gemfile* ./
RUN bundle install -j 8
COPY . /${WORKDIR}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "s"]
