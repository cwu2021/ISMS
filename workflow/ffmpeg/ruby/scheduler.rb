#!/usr/bin/ruby
# https://stackoverflow.com/questions/43216556/how-to-split-line-read-from-text-file
f = File.open("Config.ini", "r")
# https://entrision.com/blog/formatting-dates-in-ruby/
wday = Time.now.strftime("%w")
f.each_line do |line|
# https://stackoverflow.com/questions/15993198/ruby-how-to-skip-ignore-specific-lines-when-reading-a-file
        next if line.start_with? '#'
        puts "wday match!" if line.split(",")[2] == wday
end
