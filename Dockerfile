FROM ruby:2.7.5
#RUN apt-get update && apt-get install -y shared-mime-info \ 
    #postgresql-client \ 
    #nodejs
    #&& apt-get -q clean \ 
    #&& rm -rf /var/lib/apt/lists

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /get_jobs
WORKDIR /get_jobs
COPY Gemfile /get_jobs/Gemfile
COPY Gemfile.lock /get_jobs/Gemfile.lock
RUN bundle install
COPY . /get_jobs

# script to be execeuted everytime container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]


ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES true

EXPOSE 3000


#start server
CMD ["rails", "server", "-b", "127.0.0.0"]