#/bin/bash

sed -i '1 i\PERSONNEL FILE' $1
sed -i '/[[:digit:]]500$/d' $1
sed -E 's/([^a-Z]|^)([[:upper:]]\w+)[[:space:]]([[:upper:]]\w+)/\3 \2/' $1
sed -i '$a\THE END' $1
