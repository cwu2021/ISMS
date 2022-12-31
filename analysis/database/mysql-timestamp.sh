#!/bin/bash
# https://stackoverflow.com/questions/1855082/getting-mysql-data-after-specific-date
# https://www.w3schools.com/sql/sql_like.asp
cat > mysql-timestamp.sql << EOF
use MyDatabase;
SELECT * FROM table WHERE TheNameOfTimestampColumn > '2009-01-28 21:00:00';
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
EOF
mysql -p < mysql-timestamp.sql > myoutput.txt
