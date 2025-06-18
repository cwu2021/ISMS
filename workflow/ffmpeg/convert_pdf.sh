#!/bin/bash
# convert pdf to png. bypass ImageMagick security policy 'PDF' blocking conversion first.
# https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion
# add <policy domain="coder" rights="read | write" pattern="PDF" /> just before </policymap> in /etc/ImageMagick-6/policy.xml
# https://stackoverflow.com/questions/2869908/convert-pdf-to-png-using-imagemagick
apt install imagemagick
convert -density 300 a.pdf -resize 25% a.png
# FBI發出安全警示，駭客利用免費轉檔網站散佈惡意軟體 https://www.twcert.org.tw/newepaper/cp-94-10031-f8fcd-3.html
