#!/bin/bash

#help:

# ./run_in_all_DB.sql "query"

#remember the quotes on the query :D

# read query from first command line parameter
sql=$1
# mysql credential
read -s -p "User: " user
read -s -p "Enter Password: " pass
#user="root"
#pass=""
echo "";

all_dbs="$(mysql -u $user -p$pass -Bse 'show databases')"

for db in $all_dbs
     do
        if test $db != "information_schema"
            then if test $db != "mysql"
            then {
                echo "$db";
                echo "---------------------";
                mysql -u$user -p$pass $db -sN -e "$sql"
            }
        fi
    fi
     done