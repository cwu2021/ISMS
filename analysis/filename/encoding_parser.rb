# https://stackoverflow.com/questions/11664403/does-ruby-provide-a-way-to-do-file-read-with-specified-encoding
# https://gist.github.com/cofemei/0b0e7516abe45763e01ba4097e46d099
s = File.open('big5_table.html','r').read.force_encoding('BIG5').encode('UTF-8', invalid: :replace, undef: :replace, replace: "")
print s
# some code in bash
#cfname='Creation'
#duration=30
#echo "Date;Time;Duration"
#grep $cfname big5_table.html | grep '<tr><td>' | cut -d '<' -f3 | while read LINE
# do
#cfdate=`echo $LINE | cut -d ' ' -f1 | cut -d '>' -f2`
#cftime=`echo $LINE | cut -d ' ' -f2`
#echo "$cfdate;$cftime;$duration"
# done
