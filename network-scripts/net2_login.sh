#!/bin/bash

# Check if the user provided a filename as an argument
if [ -z "$1" ]; then
  echo "No time period as input argument! Try again"
  exit 1
fi

# Define the url URL and the login credentials
url=https://net2.sharif.edu/login
username=username
password=password
time_period=$1

# Check if the user is logged in by looking for a specific string in the url content
# Change the string according to the url

while true; do

	login_check=$(curl -s $url | grep "You are logged in")

	# If the login check is empty, the user is not logged in
	if [ -z "$login_check" ]; then
	  echo "You are not logged in to $url"
	  curl -s -d "username=$username&password=$password" -X POST $url >/dev/null
	  echo "You have logged in to $url"
	else
	  echo "You are already logged in to $url"
	fi
	
	sleep $time_period

done
