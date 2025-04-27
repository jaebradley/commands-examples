function main() {
  wc "$(pwd)/wc/files/example 1" | awk '{print "lines:" $1, "words:" $2, "bytes:" $3}'
  if [[ 0 -ne $? ]]; then echo "Could not calculate newlines count" && exit 255; fi
}

main
