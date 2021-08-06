#!/bin/bash

# clone this repo
git clone git@github.com:mugbug/conventional-commits.git

CURRENT_DIR=`pwd`
# update gitignore
echo "node_modules/" >> .gitignore

# install commitlint
npm install --save-dev @commitlint/{cli,config-conventional}

# create commitlint config files
cp conventional-commits/commitlint.config.js $CURRENT_DIR
cp conventional-commits/parser-preset.js $CURRENT_DIR

# install husky
npm install husky --save-dev

# activate
npx husky install

# add the commit hook
npx husky add .husky/commit-msg 'npx --no-install commitlint --edit $1'

# add PR title lint github action
GH_FOLDER=$CURRENT_DIR/.github
GH_ACTIONS_FOLDER=$GH_FOLDER/workflows/

if [ -d "$GH_FOLDER" ]; then
  cd .github && mkdir workflows && cd ..
fi

if [ ! -d "$GH_ACTIONS_FOLDER" ]; then
  mkdir .github && cd .github && mkdir workflows && cd ..
fi

cp conventional-commits/pull_request_lint.yml $CURRENT_DIR/.github/workflows/

# clean everything up
rm -rf conventional-commits
