#!/bin/sh -e

echo "Hello!"
echo "Hello ${1}"
echo "Hello #1 ${INPUTS_WHO_TO_GREET}"
echo "Hello #2 ${inputs_who_to_greet}"

printenv
