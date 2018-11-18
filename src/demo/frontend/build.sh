#!/bin/bash
cd "$(dirname "$0")"

mkdir -p target

browserify index.js | sed '/^$/d; s/^\s*//; s/\s*$//'  > target/bundle.js
cat index.html | sed '/^$/d; s/^\s*//; s/\s*$//' > target/index.html
