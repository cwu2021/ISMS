print "before comment, this OS os: ",$^O,"\n";
=begin comment
line one.
line two.
line three.
=end comment
=cut
print "after comment, epoch time is: ",localtime(),"\n";
