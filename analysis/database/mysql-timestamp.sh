#!/bin/bash
# https://stackoverflow.com/questions/1855082/getting-mysql-data-after-specific-date
# https://www.w3schools.com/sql/sql_like.asp
# https://newaurora.pixnet.net/blog/post/144744938-mysql-%E5%9F%BA%E6%9C%AC%E8%AA%9E%E6%B3%95%28%E6%9F%A5%E8%A9%A2%E3%80%81%E6%8F%92%E5%85%A5%E3%80%81%E6%9B%B4%E6%96%B0%29
cat > mysql-timestamp.sql << EOF
use MyDatabase;
update phpbb_users set user_level=1 where username='myadmin';
SELECT * FROM table WHERE TheNameOfTimestampColumn > '2009-01-28 21:00:00';
SELECT * FROM Customers WHERE CustomerName LIKE 'a%';
EOF
mysql -p < mysql-timestamp.sql > myoutput.txt
