#!/bin/bash
myargs=()
z1="-h is for help."
z2="-v is for Verbose."
z3="-d is for Debug."

while [ $# -gt 0 ]; do

	myargs+=("$1")

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



			;;
		-d )
			debug=1
			case "$2" in
			[1-5] )

				num=$2

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
