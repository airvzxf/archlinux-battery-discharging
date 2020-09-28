#!/bin/bash

makepkg --printsrcinfo > .SRCINFO
git status
echo "Write your commit comment: "
read -r COMMENT
git add ./PKGBUILD ./.SRCINFO
git commit -m "${COMMENT}"
git push master origin/master
