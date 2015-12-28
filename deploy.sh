#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd book

git init
git config user.name "blackanger"
git config user.email "blackanger.z@gmail.com"

git remote add upstream "https://ZhangHanDong@github.com/RustStudy/book.git"
git fetch upstream
git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
