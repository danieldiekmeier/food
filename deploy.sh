#!/bin/sh

# These environment variables are sometimes needed by the running daemons
export USER=danjel
export HOME=/home/danjel

# Include the user-specific profile
source $HOME/.bash_profile

export MIX_ENV=prod
export PORT=65473
export HOST="rezepte.danieldiekmeier.de"

# Now let's go!
cd /home/danjel/food
git pull
mix phx.digest.clean

cd /home/danjel/food/assets
./node_modules/.bin/brunch build -p

cd /home/danjel/food
mix ecto.migrate
mix run priv/repo/seeds.exs

svc -du /home/danjel/service/food

