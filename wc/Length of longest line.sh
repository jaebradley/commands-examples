function main() {
  let longestLineLength
  longestLineLength=$(wc -L "$(pwd)/wc/files/example 1" | awk '{print $1}')
  if [[ 0 -ne $? ]]; then echo "Could not calculate longest line length" && exit 255; fi
  if [[ "423" -ne "${longestLineLength}" ]]; then echo "Unexpected longest line length: ${longestLineLength}" && exit 255; fi
}

main
