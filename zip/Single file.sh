#!/usr/bin/env bash

function main() {
  local temporary_directory
  temporary_directory=$(mktemp -d)
  if [[ 0 -ne $? ]];
  then echo "Failed to create a temporary directory" && exit 255;
  else echo "Created temporary directory: ${temporary_directory}";
  fi

  local content="Hello, world"
  local hashed_content
  hashed_content=$(md5 -q <<< "${content}")
  if [[ 0 -ne $? ]]; then echo "Failed to hash content" && exit 255; fi

  local temporary_filename="${temporary_directory}/${hashed_content}"

  echo -n "${content}" > "${temporary_filename}"

  local zip_filename="${temporary_directory}/${hashed_content}.zip"
  zip "${zip_filename}" "${temporary_filename}"

  echo "Created zip file: ${zip_filename}"
}

main

