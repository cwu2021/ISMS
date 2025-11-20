# https://medium.com/@dmitrijkumancev571/awesome-python-scripts-6711873a35c3
import random
import string
total = string.ascii_letters + string.digits + string.punctuation
length = 16
password = "".join(random.sample(total, length))
print(password)
# Password Best Practices: We take a look at passwords, passkeys, and passphrases and offer recommendations for team-capable password management.