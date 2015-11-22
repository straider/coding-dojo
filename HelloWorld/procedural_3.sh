#!/usr/bin/env sh

MESSAGE='Hello, %s!\n'

function greet() {
  message="$1"
  name="$2"
  name=${name:-'World'}

  printf "$message" "$name"
}

greeting=$( [[ $# -ne 0 ]] && echo $( greet "$MESSAGE" "$1" ) || echo $( greet "$MESSAGE" ) )
echo $greeting

echo '» José Carlos Monteiro «'
