#!/bin/bash

notes_dir="$HOME/notes"
cd $notes_dir

fzf_output=$(fzf --reverse --prompt=$notes_dir/ --border --print-query --preview="head -n 20 {+}" --preview-window=down:50% --inline-info)
exitcode=$?

# --print-query prints the query which can be used
# to create a new file if there is no match
# in this case the query is printed before a match in a new line

# split the output into an array
readarray -t y <<<"$fzf_output"

query=${y[0]} # query is the firts line
match=${y[1]} # match is the second line if there is any

# Exit codes
#0      Normal exit
#1      No match
#2      Error
#130    Interrupted with CTRL-C or ESC
if [[ 0 -eq $exitcode ]]; then
  # open the matched file with an editor
  $EDITOR $notes_dir/$match
elif [[ 1 -eq $exitcode ]]; then
  # create a new md file where the file name will be the query
  $EDITOR $notes_dir/$query.md
fi
