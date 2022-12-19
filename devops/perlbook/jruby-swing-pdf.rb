# Opal is a Ruby to JavaScript source-to-source compiler.
# https://github.com/opal/opal#usage
# How to Choose Your Ruby Interpreters and Runtimes | Toptal
# https://www.toptal.com/ruby/the-many-shades-of-the-ruby-programming-language
# https://github.com/jruby/jruby/wiki/CallingJavaFromJRuby
# This is the 'magical Java require line'.
require 'java'

# With the 'require' above, we can now refer to things that are part of the
# standard Java platform via their full paths.
frame = javax.swing.JFrame.new("Window") # Creating a Java JFrame
label = javax.swing.JLabel.new("Hello")

# We can transparently call Java methods on Java objects, just as if they were defined in Ruby.
frame.add(label)  # Invoking the Java method 'add'.
frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
frame.pack
frame.setVisible(true)

# iText v5 jar from here https://kb.itextpdf.com/home/it7kb/faq/is-itext-free
pdf = com.itextpdf.text.Document.new
para = com.itextpdf.text.Paragraph.new 'Brought to you by JRuby'
file = java.io.FileOutputStream.new 'pdf_demo.pdf'

com.itextpdf.text.pdf.PdfWriter.get_instance pdf, file

pdf.open
pdf.add para
pdf.close

# IronLanguages for .NET
# https://github.com/IronLanguages
# https://learn.microsoft.com/en-us/archive/msdn-magazine/2009/february/net-interop-getting-started-with-ironruby-and-rspec-part-1
