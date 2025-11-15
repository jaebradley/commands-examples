#!/bin/awk -f
BEGIN {
  FS=","
}

{
  if (NR > 1 && (!(NR%2))) {
    counter++
    { print NR,$2 }
  }

  if (10 == counter) {
    exit
  }
}

