#!/bin/sh -ex

echo "Hello #1 ${SSH_PUBLIC_KEY}"
echo "Hello #2 ${ISRAEL}"

find / -iname "arch-aur" 2> /dev/null
find / -iname "PKGBUILD" 2> /dev/null

ls -lha /github/
ls -lha /github/workspace/
ls -lha /github/workspace/arch-aur/
