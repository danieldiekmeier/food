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

git remote update

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date. No deploy needed."

elif [ $LOCAL = $BASE ]; then
    echo "Need to pull. "
    git pull
    mix phx.digest.clean

    cd /home/danjel/food/assets
    ./node_modules/.bin/brunch build -p

    cd /home/danjel/food
    mix ecto.migrate
    mix run priv/repo/seeds.exs

    svc -du /home/danjel/service/food

elif [ $REMOTE = $BASE ]; then
    echo "Need to push. Deploy aborted."

else
    echo "Diverged. Deploy aborted."
fi
