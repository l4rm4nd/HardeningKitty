#!/bin/bash
# This script takes an input file, such as a HardeningKitty list and loops over a second input file to do string substitutions
# The second input file hereby specifies two strings, separated with a semi-colon ;
# The first string specifies the search term and the second one the replacement string
# 
# Example replacement.txt file:
# Roses are red; Rosen sind rot
# 
# Note: Specify an empty line at the end!

if [ $# -eq 0 ]
	then
		echo "[!] Please specify two input files."
		echo ".\convert.sh <KITTY-LIST> <REPLACEMENT-LIST>"
	else
		echo
		echo "[!] Processing '$1'"
		echo 


		while IFS= read -r line; do
			EN=$(echo -e $line | cut -d ";" -f 1)
			DE=$(echo -e $line | cut -d ";" -f 2)
			echo -e "[*] Replacing '$EN' with '$DE'"
			sed -i "s/$EN/$DE/g" $1
		done <$2
		echo
		echo "[SUCCESS] Replacements done. Enjoy!"
fi
