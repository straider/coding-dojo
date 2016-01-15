#!/usr/bin/env bash

for i in {1..100}; do
  if   [ $(( $i % 3 )) -eq 0 -a $(( $i % 5 )) -eq 0 -a $(( $i % 7 )) -eq 0 ]; then
    line='FizzBuzzDazz'
  elif   [ $(( $i % 5 )) -eq 0 -a $(( $i % 7 )) -eq 0 ]; then
    line='BuzzDazz'
  elif   [ $(( $i % 3 )) -eq 0 -a $(( $i % 7 )) -eq 0 ]; then
    line='FizzDazz'
  elif   [ $(( $i % 3 )) -eq 0 -a $(( $i % 5 )) -eq 0 ]; then
    line='FizzBuzz'
  elif [ $(( $i % 7 )) -eq 0 ]; then
    line='Dazz'
  elif [ $(( $i % 5 )) -eq 0 ]; then
    line='Buzz'
  elif [ $(( $i % 3 )) -eq 0 ]; then
    line='Fizz'
  else
    line=$( printf "%04d" $i )
  fi

  echo $line
done
