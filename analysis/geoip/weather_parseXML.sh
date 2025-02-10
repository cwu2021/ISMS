#https://grantm.github.io/perl-libxml-by-example/dom.html
#aws s3 cp --no-sign-request s3://cwaopendata/Forecast/ . --recursive
#aws s3 cp --no-sign-request s3://cwaopendata/Observation/ . --recursive
##cd /data/cwa/Observation
#aws s3 cp --no-sign-request s3://cwaopendata/Observation/O-A0001-001.xml . 
filename='/data/cwa/Observation/O-A0001-001.xml'
StationID='C0AJ80' #板橋
echo "The Station ID is: $StationID"
#grep $StationID -A 32 $filename | grep \<Weather\> -A 9

# ASCII visualization sample
#curl wttr.in/:help
curl wttr.in/Taipei?n?1?F
