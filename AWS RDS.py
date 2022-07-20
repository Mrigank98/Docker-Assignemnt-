#For the sake of demonstration , I am taking MYSQL RDS
#Install pyMSQL connector in your file directory 
#pip install pyMSQL #Install with dependecies

#MYSQL RDS Details

endpoint = "aws.us-east-1.rds.amazonaws.com"     #provide your RDS ENDPOINT and make sure port should be open in security groups 
username = "mrigank"
password = "aws_RDS"
database_name = "myDB"

#Connection to Amazon RDS using python 

connection = pymysql.connect(endpoint,user=mrigank,password=aws_RDS,database_name=myDB)

# Running query in RDS to get rows in database_name table , we are creating a function in order to remove re-connection to RDS everytime 

def myfunc():
    cursor = connection.cursor()
    cursor.execute('SELECT * from myDB')
    rows = cursor.fetchall()                 #It will display all the rows and column from myDB
    for row in rows:
        print("{0} {1} {2}".format(row[0], row[1], row[2]))

myfucn()

