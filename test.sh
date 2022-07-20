#!/bin/bash
#Author: Mrigank Bhaskar
#Intial version 1.4 Date:20072022
#Script to test connectivity to RDS, if connection is established it will result as conncetion established else it will fail
#for the sake of demonstration, I am assuming MYSQL RDS

#MYSQL RDS details

RDS_MYSQL_ENDPOINT="Provide your RDS endpoint";
RDS_MYSQL_USER="Provid your RDS username";
RDS_MYSQL_PASS="Provide your RDS password";
RDS_MYSQL_BASE="Provide your database name";
RDS_IP="Provide your RDS IP"
#Run the below command to connect your RDS server

mysql -h $RDS_MYSQL_ENDPOINT -u $RDS_MYSQL_USER -p$RDS_MYSQL_PASS -D $RDS_MYSQL_BASE -e 'quit';

#if receive any error ,like "mysql is not found", then probably you don't have mySQL client installed. Kindly install it using below command
# sudo apt-get install -y mysql-client

if [ $? -eq 0 ]; then
  echo "MySQL RDS connection: ESTABLISHED"     
elif [ $? -ne 0 ]; then           
  nc -z -v -w5 $RDS_IP $PORT ; echo $?        #check port connection
elif [ $? -ne 0 ]; then                       #if port retruns non zero value, run ping test to check the status of the RDS
  ping -c1 -W1 $RDS_IP ; echo $?  # ping output has different error code, if error code is 0 it is pinging else it is not pinging 
else 
  echo "MYSQL connection: Failed to test connectivity possible reasons might be the port is not open in security groups. Please check and try again"
fi
