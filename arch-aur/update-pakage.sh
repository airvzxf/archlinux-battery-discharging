#!/bin/bash

makepkg --printsrcinfo > .SRCINFO
git st
echo "Write your commit comment: "
read -r COMMENT
git add arch-aur/PKGBUILD arch-aur/.SRCINFO
git commit -m "${COMMENT}"
git push master origin/master
