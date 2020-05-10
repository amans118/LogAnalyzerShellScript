#!/bin/bash
echo Please enter logfile location:
read logfile
echo Please enter No. of top domains to be displayed:
read domains
echo Please enter No. of top users to be displayed:
read users
function stats () {
echo Top $domains Domains are:
awk -F'\\^\\^' 'FNR == 1 {next} {print $3}' $logfile | sort | uniq -c | sort -nr | head -n $domains

echo Top $users Users are:
awk -F'\\^\\^' 'FNR == 1 {next} {print $9}' $logfile | sort | uniq -c | sort -nr | head -n $users

echo The number of times each users have logged in:
awk -F'\\^\\^' 'FNR == 1 {next} {print $9}' $logfile | sort | uniq -c | sort -nr

}
stats &> /home/$USER/stats.log
