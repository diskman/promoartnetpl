FROM ruby:3.2

# Install system dependencies including Node.js and dos2unix
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get update && apt-get install -y \
    build-essential \
    git \
    nodejs \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /srv/jekyll

# Install Jekyll and Bundler
RUN gem install jekyll:4.3.3 bundler:2.4.19

# Copy dependency files first
COPY Gemfile package.json ./

# Install gems and npm packages
RUN bundle install && npm install

# Copy the rest of the project
COPY . .
COPY entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh && chmod +x /entrypoint.sh

# Expose ports
EXPOSE 4000 35729

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
