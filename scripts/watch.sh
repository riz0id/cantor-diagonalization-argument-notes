#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

# Get top-level directory of the git repository.
TOP="$(git rev-parse --show-toplevel)"

cd "$TOP"

# Set the names of the top-level .tex file to use as input to latexmk and output
# directory to send build artifacts to.
TARGET="content.tex"
OUTPUT="out"

IN_FILE="$(find . -name "$TARGET")"

if [ ! -e "$IN_FILE" ]; then
  echo "no file in repository matches given input file \"$IN_FILE\""
  exit 1
fi

OUT_DIR="$(find . -type d -name "$OUTPUT")"

if [ ! -e "$IN_FILE" ]; then
  echo "no directory in repository matches given output directory \"$IN_FILE\""
  exit 1
fi

latexmk -pdf -pvc \
  -jobname="$OUT_DIR/notes" \
  "$IN_FILE"
