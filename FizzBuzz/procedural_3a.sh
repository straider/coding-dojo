#!/usr/bin/env bash

PRIME_WORDS=( [3]='Fizz' [5]='Buzz' )

for i in {1..100}; do
  line=''
  for key in ${!PRIME_WORDS[@]}; do
    value=${PRIME_WORDS[$key]}
    if [ $(( $i % $key )) -eq 0 ]; then
      line+="$value"
    fi
  done
  [[ "$line" == "" ]] && line+=$( printf "%04d" $i ) || line+=''

  echo $line
done
