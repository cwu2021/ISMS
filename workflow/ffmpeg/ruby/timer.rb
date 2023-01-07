#!/usr/bin/ruby
t = Time::new
puts t.ctime
puts t.strftime("It is %m/%d/%Y")
puts t.strftime("Epoch is %s")
# https://wizardforcel.gitbooks.io/w3school-ruby/content/22.html
# https://www.geeksforgeeks.org/ruby-time-strftime-function/
a = Time.now.strftime("%s").to_i
b = Time.local(2023, 1, 2, 23, 30).strftime("%s").to_i
# https://code-maven.com/convert-string-to-number-in-ruby
sleep b-a
# run another bat for system command.
# system 'ffmpeg'
