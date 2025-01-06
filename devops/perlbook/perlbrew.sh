wget https://install.perlbrew.pl -O install.perlbrew.pl
file install.perlbrew.pl
bash install.perlbrew.pl
perl -v
source perl5/perlbrew/etc/bashrc
perlbrew help
perlbrew available
perlbrew install 5.40.0
perlbrew switch 5.40.0
perl -v
