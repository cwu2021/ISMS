# https://www.rubyguides.com/2015/05/working-with-files-ruby/
File.foreach("users.txt") { |line| puts line }

# https://www.rubyguides.com/2018/11/ruby-heredoc/
type  = "healthy"
table = "food"
query = <<-SQL
SELECT * FROM #{table}
WHERE #{type} = true
SQL

File.open("log.txt", "w") { |f| f.write "#{Time.now} - User logged in\n" }

# Multiline Strings in Ruby. The Ruby programming language lets you…
# https://modernlearner.ghost.io/ghost/#/editor/post/5f8d7b1c8424d10039898df7