#!/bin/bash
#
# usage: bash uncomment-dir.sh <directory>
# author: pavan
#

recurse() {
 for i in "$1"/*;do
    if [ -d "$i" ];then		
        recurse "$i"
    elif [ -f "$i" ]; then        
		if [[ ($i == *.h) || ($i == *.cpp) ]];then
			echo "Uncomment $i file..."
			gcc -fpreprocessed -dD -E -P "$i" 2> /dev/null >> "$i.uncomment"
			rm -f $i
			mv "$i.uncomment" $i
		fi
    fi
 done
}

if [[ "$#" != 1 ]] ; then
  echo "Usage: uncomment-dir directory" > /dev/stderr
  exit
fi

recurse $1



