@lines = `df -h `;
for $line (@lines) { @tab = split(/\s+/, $line) if $line =~ /md4/; }
$tab[-2] =~ s/%//;
print "$tab[-2]\% is more than 80\%.\n" if $tab[-2] > 80;
