#!/bin/awk -f
BEGIN {
  FS=","
}

{
  if (NR > 1 && ($3 == "BRK" || $3 == "NYK")) {
    { print NR, $2, $3 }
  }
}

