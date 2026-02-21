#!/bin/bash
set -e

# Fix Windows line endings
dos2unix Gemfile package.json _config.yml || true

# Install dependencies
bundle check || bundle install
if [ ! -d "node_modules" ]; then
  npm install
fi

# Initial Tailwind build
npx tailwindcss -i ./assets/css/main.css -o ./assets/css/style.css

# Start Tailwind in watch mode in the background
npx tailwindcss -i ./assets/css/main.css -o ./assets/css/style.css --watch &

# Start Jekyll server
bundle exec jekyll serve --host 0.0.0.0 --livereload --force_polling
