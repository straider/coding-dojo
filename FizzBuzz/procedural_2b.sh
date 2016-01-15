#!/usr/bin/env bash

for i in {1..100}; do
  line=''
  [[ $(( $i % 3 )) -eq 0 ]] && line+='Fizz'                || line+=''
  [[ $(( $i % 5 )) -eq 0 ]] && line+='Buzz'                || line+=''
  [[ $(( $i % 7 )) -eq 0 ]] && line+='Dazz'                || line+=''
  [[ "$line" == ""       ]] && line+=$( printf "%04d" $i ) || line+=''

  echo $line
done
