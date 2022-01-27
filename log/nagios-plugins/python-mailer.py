# https://pypi.org/project/mailer
# pip3 install mailer

from mailer import Mailer
from mailer import Message

# prepare an mx.your.company as forwarder to your own inbox.
message = Message(From="root@localhost.localdomain",
		  To="user@your.company",
		  charset="utf-8")
message.Subject = "Test alert from mailer"
message.Html = """This is <strong>HTML</strong>."""	
message.Body = """This is alternate text."""	

# local smtpd such as postfix is required. debug with /var/log/maillog.
sender = Mailer('localhost')
sender.send(message)
