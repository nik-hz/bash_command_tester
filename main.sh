#!/bin/bash

#usage ./name command to run, file with sample command, output file to save to

#command
command_arg=$1
#command file location
commands_file=$2
#output file
output_file=$3

while read -r cmd
do
  # Ignore comments and blank lines
  if [[ -n "$cmd" && ! "$cmd" =~ ^[[:space:]]*# ]]; then
    # Run the command and save its output to the file
    $command_arg $cmd >> "$output_file" 2>&1
  fi
done < <(grep -v '^[[:space:]]*$\|^[[:space:]]*#' "$commands_file")