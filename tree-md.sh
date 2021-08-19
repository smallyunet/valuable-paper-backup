#!/bin/bash

#File: tree-md

tree=$(tree -N -t --noreport -I '*~|*.md|*.sh|*.yml|CNAME' --charset utf-8 -v $1 |
       sed -e 's/\│   ├── /  - /g' |
       sed -e 's/\│   └── /  - /g' |
       sed -e 's/\└── /- /g' |
       sed -e 's/├── /- /g' |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1<a href=\"\2\">\4<\/a>:g')

printf "# Index\n\n${tree}\n" > README.md

