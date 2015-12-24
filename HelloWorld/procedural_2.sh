#!/usr/bin/env sh

set -eu

if [ $# -ne 0 ]; then
  name=$1
fi
name=${name='World'}
echo "Hello, $name!"

echo '» José Carlos Monteiro «'
