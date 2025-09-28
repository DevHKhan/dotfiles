#!/usr/bin/bash

declare UPDATES
WORDS=$(aur-check-updates | wc -w)

if [[ $WORDS == 6 ]]; then
  UPDATES=0
else
  UPDATES=$(($(aur-check-updates | wc -l) - 1))
fi

echo $UPDATES
