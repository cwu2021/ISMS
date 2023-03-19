# https://docs.checkmk.com/latest/en/regexes.html
# https://perldoc.perl.org/perlrequick

"State is OK" =~ /State.*OK/; # Match

# Common lines between two files
# https://unix.stackexchange.com/questions/398142/common-lines-between-two-files
`comm -12 <(sort file1) <(sort file2)`
