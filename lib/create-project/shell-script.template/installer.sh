#!/bin/sh
printf "INFO: creating project file... "
PROJECT_NAME="$1"
AUTHOR_NAME="$2"
MAIN_FILE="$PROJECT_NAME.sh"
mv main_file.sh "$MAIN_FILE"
echo "DONE"

printf "INFO: generating makefile... "
echo "MAIN_FILE=$MAIN_FILE" > Makefile
cat Makefile.tmp >> Makefile
rm Makefile.tmp
echo "DONE"
exit 0