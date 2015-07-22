#!/bin/bash
#
# usage: bash uncomment-file.sh <input-file>
# author: pavan
#

if [[ "$#" != 1 ]] ; then
  echo "Usage: uncomment-file input-file" > /dev/stderr
  exit
fi

gcc -fpreprocessed -dD -E -P "$1" 2> /dev/null
