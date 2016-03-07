#!/bin/sh

mix do deps.get
MIX_ENV=prod mix release.clean
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
docker build -t kitteh/prod:0.0.1 .
