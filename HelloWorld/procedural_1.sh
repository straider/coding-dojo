#!/usr/bin/env sh

set -eu

if [ $# -eq 0 ]; then
  name='World'
else
  name=$1
fi
echo "Hello, $name!"

echo '» José Carlos Monteiro «'
