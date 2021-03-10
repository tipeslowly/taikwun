#!/bin/bash

# Change this if you change the output folder in config.yml
BUILD_DIR="site"

DIR=$(dirname "$0")
cd $DIR/..

# if [[ $(git status -s) ]]
# then
#     echo "The working directory is dirty. Please commit any pending changes."
#     exit 1;
# fi

echo "Deleting old publication"
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

git subtree pull --prefix $BUILD_DIR origin gh-pages

echo "Generating site"
# hugo --config=config.yml,config/environments/github.yml
quire site --env=github

echo "Updating gh-pages branch (deleting first to avoid conflict)"
#git push origin --delete gh-pages
git add -f $BUILD_DIR && git commit -m "Automated deploy at $(date)."
#git subtree push --prefix $BUILD_DIR origin gh-pages
git push origin `git subtree split --prefix $BUILD_DIR origin`:gh-pages --force
