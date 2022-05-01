#!/bin/sh

# These environment variables are sometimes needed by the running daemons
export USER=danjel
export HOME=/home/danjel

# Include the user-specific profile
source $HOME/.bash_profile

export MIX_ENV=prod
export PORT=4001
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

    npm --prefix assets install

    mix deps.get
    mix phx.digest.clean
    mix assets.deploy
    mix ecto.migrate
    mix run priv/repo/seeds.exs

    supervisorctl restart food

elif [ $REMOTE = $BASE ]; then
    echo "Need to push. Deploy aborted."

else
    echo "Diverged. Deploy aborted."
fi
