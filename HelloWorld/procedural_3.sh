#!/usr/bin/env sh

set -eu

MESSAGE='Hello, %s!\n'

function greet() {
  message="$1"
  name=${2:-'World'}

  printf "$message" "$name"
}

greeting=$( [[ $# -ne 0 ]] && echo $( greet "$MESSAGE" "$1" ) || echo $( greet "$MESSAGE" ) )
echo $greeting

echo '» José Carlos Monteiro «'
