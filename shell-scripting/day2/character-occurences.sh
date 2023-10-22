#!/bin/bash

# number of S in given word

echo " enter word: "
read a
set -x
# a=misssissipi

grep -o "s" <<<"$a" | wc -l  # -o means only 