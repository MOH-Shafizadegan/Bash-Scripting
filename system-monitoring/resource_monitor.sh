#!/bin/bash

# Check if the user provided a filename as an argument
if [ -z "$3" ]; then
  echo "No filename as input argument! Try again"
  exit 1
fi

logfile=$3

# Check and delete the log file if it exists
if [ -f "$logfile" ]; then
  echo "Log file $logfile already exists. This file will be overwritten ."
  rm "$logfile"
fi

# Define the threshold for cpu and memory usage (in percentage)
cpu_threshold=$1
mem_threshold=$2

date=$(date --iso-8601=seconds)
	
cpu_usage=$(top -b -n 1 | awk 'NR>7 && $9>0 {print $1,$9}')
mem_usage=$(top -b -n 1 | awk 'NR>7 && $10>0 {print $1,$10}')

# Get the total memory usage using free and awk
total_mem_usage=$(free | awk '/Mem/ {printf "%.0f\n", $3/$2*100}')
	
# Write the date and time to the log file
echo "Date and time: $date" >> $logfile

# Write the cpu and memory usage of each task to the log file
echo "CPU usage of each task (PID %CPU):" >> $logfile
echo "$cpu_usage" >> $logfile
echo -e "------------------------------------- \n" >> $logfile
echo "Memory usage of each task (PID %MEM):" >> $logfile
echo "$mem_usage" >> $logfile
# Write the total memory usage to the log file
echo "Total memory usage: $total_mem_usage%" >> $logfile
echo -e "------------------------------------- \n" >> $logfile

while read -r line; do
	
	pid=$(echo "$line" | awk '{print $1}')
	cpu=$(echo "$line" | awk '{print $2}')
	
	if [ $(echo "$cpu > $cpu_threshold" | bc) -eq 1 ]; then
	    echo "Warning: Task with PID $pid is using $cpu% of CPU"
	fi
	
done <<< "$cpu_usage"

while read -r line; do
	
	pid=$(echo "$line" | awk '{print $1}')
	mem=$(echo "$line" | awk '{print $2}')
	
	if [ $(echo "$mem > $mem_threshold" | bc) -eq 1 ]; then
	    echo "Warning: Task with PID $pid is using $mem% of Memory"
	fi
	
done <<< "$mem_usage"

echo -e "\n Process finished."
