# Use the official Ruby image
FROM ruby:2.7

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Install Rails
RUN gem install rails

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the Rails application
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
