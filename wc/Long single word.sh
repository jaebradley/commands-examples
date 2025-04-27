function main() {
  let newlinesCount
  newlineCounts=$(wc -l "$(pwd)/wc/files/long single word" | awk '{print $1}')
  if [[ 0 -ne $? ]]; then echo "Could not calculate newlines count" && exit 255; fi
  if [[ "0" -ne "${newlinesCount}" ]]; then echo "Unexpected newlines count: ${newlinesCount}" && exit 255; fi

  let bytesCount
  bytesCount=$(wc -c "$(pwd)/wc/files/long single word" | awk '{print $1}')
  if [[ 0 -ne $? ]]; then echo "Could not calculate bytes count" && exit 255; fi
  if [[ "3200" -ne "${bytesCount}" ]]; then echo "Unexpected bytes count: ${bytesCount}" && exit 255; fi

  let wordsCount
  wordsCount=$(wc -w "$(pwd)/wc/files/long single word" | awk '{print $1}')
  if [[ 0 -ne $? ]]; then echo "Could not calculate words count" && exit 255; fi
  if [[ "1" -ne "${wordsCount}" ]]; then echo "Unexpected words count: ${wordsCount}" && exit 255; fi
}

main
