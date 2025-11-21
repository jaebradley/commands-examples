#!/bin/env bash

function main() {
  if [[ 1 -ne $# ]]; then printf "Expected exactly 1 argument, the script directory\n" && exit 255; fi

  local -r script_directory="$1"
  if [[ ! -d "${script_directory}" ]]; then printf "${script_directory} is not a directory\n" && exit 255; fi

  while IFS=  read -r -d ''; do
    local directory=$(dirname "$REPLY")
    if [[ 0 -ne $? ]]; then printf "Unable to parse directory name for $REPLY\n" && exit 255; fi

    local expected_output_file_path="${directory}/expected"
    if [[ ! -f "${expected_output_file_path}" ]]; then printf "Expected ${expected_output_file_path} to be a file\n" && exit 255; fi
    if [[ ! -r "${expected_output_file_path}" ]]; then printf "Expected ${expected_output_file_path} to be readable\n" && exit 255; fi

    local input_file_path_file_path="${directory}/input file path"
    if [[ ! -f "${input_file_path_file_path}" ]]; then printf "Expected ${input_file_path_file_path} to be a file\n" && exit 255; fi
    if [[ ! -r "${input_file_path_file_path}" ]]; then printf "Expected ${input_file_path_file_path} to be readable\n" && exit 255; fi

    local input_file_path=$(cat "${input_file_path_file_path}")
    if [[ 0 -ne $? ]]; then printf "Unable to output the input file path\n" && exit 255; fi

    $(awk -f "${directory}/program.awk" "${input_file_path}" | cmp -s - "${expected_output_file_path}")
    if [[ 0 -ne $? ]]; then printf "awk failed\n" && exit 255; fi

    printf "awk successfully executed for ${directory}\n"
  done < <(find "${script_directory}" -type f -name "program.awk" -print0)
}

main "$@"

