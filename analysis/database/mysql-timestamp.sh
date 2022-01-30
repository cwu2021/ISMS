#!/bin/bash
# https://stackoverflow.com/questions/1855082/getting-mysql-data-after-specific-date
cat > mysql-timestamp.sql << EOF
use MyDatabase;
SELECT * FROM table WHERE TheNameOfTimestampColumn > '2009-01-28 21:00:00';
EOF
