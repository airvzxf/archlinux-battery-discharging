#!/bin/bash

makepkg -f
rm -fR battery-discharging-beep* pkg src .SRCINFO
makepkg --printsrcinfo > .SRCINFO

git diff --exit-code
git add .
git status
git commit -m "Automatic deployment coming from the official repository in GitHub using CI (Continuous Integration)."
git push
