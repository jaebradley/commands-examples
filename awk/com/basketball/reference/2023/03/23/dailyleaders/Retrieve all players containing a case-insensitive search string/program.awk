#!/bin/awk -f
BEGIN {
  FS=","
}

{
  if (NR > 1 && tolower($2) ~ /jones/) {
    { print NR, $2 }
  }
}

