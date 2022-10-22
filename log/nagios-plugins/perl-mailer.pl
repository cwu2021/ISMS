# http://blogs.perl.org/users/den/2022/09/sending-simple-email.html
use Email::Sender::Simple qw(sendmail);
use Email::Simple;
use Email::Sender::Transport::Sendmail qw();
use Try::Tiny;my $email = Email::Simple->create(
 header=>[To=>$to, From=>$from,
 Subject=>$subject],
 body=>$body,
);try {
 sendmail($email,
 {from=>$from,
 transport=>Email::Sender::Transport::Sendmail->new});
} catch {
 print "Can't send mail: $_";
}
# To start from scratch in docker with latest ubuntu:
# docker run -it --name kinetic ubuntu:22.10 bash
# docker attach kinetic
# export PS1="\u@kinetic:\w#"
# apt update
# apt upgrade
# apt install cpanminus
# cpanm install Net::SMTP
# perl -v
