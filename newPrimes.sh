#!/bin/bash
if [ $# -eq 0 ]
then
	echo "Please provide an argument"
	exit 1
fi

#check if the argument is a number, if not exit with error code 2 and print error message to stderr
if ! [[ "$1" =~ ^[0-9]+$ ]]  #if it is not a number, then it will return false and the script will exit with error code 2 and print error message to stderr. If it is a number, then it will return true and continue with the script.
then 			    #the regex expression checks if the string contains only numbers from 0-9.
	echo "Argument must be a number" >&2 #print error message to stderr instead of stdout by using >&2 instead of just >.
	exit 2 		    #exit with error code 2.
fi 			    #end of if statement.

#check if the file primes.txt exists, if so delete it and create a new one. If not create one.
if [ -f primes.txt ]   #check if file exists by using -f flag (file). If it does exist, then delete it and create a new one. If not, then create one.
then  		     #start of if statement for checking if file exists or not.
	rm primes.txt     #delete file by using rm command (remove).
fi  	             #end of if statement for checking if file exists or not.
