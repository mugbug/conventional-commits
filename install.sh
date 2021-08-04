#!/bin/bash

CURRENT_DIR=`pwd`
# update gitignore
echo "node_modules/" >> .gitignore

# install commitlint
npm install --save-dev @commitlint/{cli,config-conventional}

# create commitlint config files
cp commitlint.config.js $CURRENT_DIR
cp parser-preset.js $CURRENT_DIR

# install husky
npm install husky --save-dev

# activate
npx husky install

# add the commit hook
npx husky add .husky/commit-msg 'npx --no-install commitlint --edit $1'

# add PR title lint github action
GH_ACTIONS_FOLDER=$CURRENT_DIR/.github/workflows/
echo $GH_ACTIONS_FOLDER

if [ ! -d "$GH_ACTIONS_FOLDER" ]; then
  mkdir .github/workflows/
fi

cp pull_request_lint.yml $CURRENT_DIR/.github/workflows/
