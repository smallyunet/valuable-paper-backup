#!/bin/bash

#File: tree-md

tree=$(tree -N -tf --noreport -I '*~|*.md|*.sh|*.yml|CNAME' --charset ascii -v $1 |
       LC_CTYPE=C sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1<a href=\"\2\">\4<\/a>:g')

printf "# Index\n\n${tree}\n" > README.md

