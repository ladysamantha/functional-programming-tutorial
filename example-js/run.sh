#!/bin/sh

NODE=$(which node)
if [ ! -x $NODE ]; then
  echo "ERROR: could not find 'node' in path"
  exit 1
fi

echo "Running imperative/procedural app"

$NODE nodejs_example.js

echo

echo "Running pure function app"

$NODE nodejs_example_pure.js

