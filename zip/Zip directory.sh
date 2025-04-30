#!/usr/bin/env bash

function create_file_from_content() {
  local content="$1"
  local directory="$2"

  local hashed_content
  hashed_content=$(md5 -q <<< "${content}")
  if [[ 0 -ne $? ]]; then echo "Failed to hash content" && exit 255; fi

  local temporary_filename="${temporary_directory}/${hashed_content}"

  echo -n "${content}" > "${temporary_filename}"
  if [[ 0 -ne $? ]]; then echo "Unable to write content to file: ${temporary_filename}" && exit 255; fi

  echo "${temporary_filename}"
}

function main() {
  local temporary_directory
  temporary_directory=$(mktemp -d)
  if [[ 0 -ne $? ]];
  then echo "Failed to create a temporary directory" && exit 255;
  else echo "Created temporary directory: ${temporary_directory}";
  fi

  local first_file
  first_file=$(create_file_from_content "Hello, world" "${temporary_directory}")

  local second_file
  second_file=$(create_file_from_content "Foobar" "${temporary_directory}")

  local zip_filename="${temporary_directory}/directory exmaple.zip"

  zip "${zip_filename}" -r "${temporary_directory}"
  if [[ 0 -ne $? ]]; then echo "Unable to write files in directory: ${temporary_directory} to ${zip_filename}" && exit 255; fi

  echo "Created zip file: ${zip_filename}"
}

main

