#!/bin/bash
myargs=()
z1="-h is for help."
z2="-v is for Verbose."
z3="-d is for Debug."

while [ $# -gt 0 ]; do
	echo "There are $# thing left to process on the cmd argument."
	myargs+=("$1")
	echo "Added '$1' to the myargs array"
	echo "Processing the '$1'."
	case $1 in
		-h )
			echo "You added \"-h\" for help."
			echo 'Processing -h'
			echo "$z1"
			echo "$z2"
			echo "$z3"
			;;
		-v )
			verbo=1
			echo 'You added "-v" for verbose.'
			echo 'Verbose mode is set to be on.'
			echo 'Processing "-v"'
			;;
		-d )
			debug=1
			case "$2" in
			[1-5] )
				echo "Debug mode is set to be ON."
				num=$2
				echo "You added \"-d\" for debug level $num."
				shift
				;;
				*)
				echo "Error: The debug option must be followed with a number within 1 to 5."
				shift
			esac
			;;
		*)
			error=$1
			echo "Error: unkown inpute $error."
			shift
			;;
	esac
	shift
	echo "Shifted command line, leaving $# things left to the cmd argument."
	echo "-----------------------------------------------------------------"
done
if [ "$verbo" == "1" ]; then
  echo "Verbose mode is On."
else
  echo "Verbose mode is Off."
fi
if [ "$debug" == "1" ]; then
  echo "Debug mode is On with $num."
else
  echo "Debug mode is Off."
fi
#echo "No cmd argument found."
echo "Myarg() array contents ${myargs[@]}"
