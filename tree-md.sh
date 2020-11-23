#!/bin/bash

#File: tree-md

tree=$(tree -tf --noreport -I '*~|*.md|*.sh' --charset ascii -v $1 |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1<a href=\"\2\">\4<\/a>:g')

printf "# Valuable Paper Backup\n\n${tree}\n" > README.md

