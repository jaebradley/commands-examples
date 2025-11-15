#!/bin/awk -f
BEGIN {
  FS=","
}

{

  if (NR > 1 && $2 ~ /^A/)
    { print $2 }
}
