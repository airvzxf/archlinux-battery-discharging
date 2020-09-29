#!/bin/sh -e

echo "Hello!"
echo "Hello ${1}"
echo "Hello #1 ${INPUT_WHO-TO-GREET}"
echo "Hello #2 ${input_who-to-greet}"

printenv
