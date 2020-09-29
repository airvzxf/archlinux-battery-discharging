#!/bin/sh -e

echo "Hello!"
echo "Hello ${1}"
echo "Hello #1 ${SSH_PUBLIC_KEY}"
echo "Hello #2 ${ssh_public_key}"
echo "Hello #3 ${ISRAEL}"
echo "Hello #4 ${israel}"

printenv
