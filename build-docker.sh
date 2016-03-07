#!/bin/sh
#
# update dependencies
mix deps.get
npm i

# assets (precompile first)
./node_modules/.bin/brunch build
MIX_ENV=prod mix phoenix.digest

# web application
MIX_ENV=prod mix release.clean
MIX_ENV=prod mix compile
MIX_ENV=prod mix release

docker build -t kitteh/web:0.0.1 .
docker build --no-cache -f Dockerfile.assets -t kitteh/assets:0.0.1 .
