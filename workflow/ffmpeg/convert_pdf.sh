#!/bin/bash
# convert pdf to png. bypass ImageMagick security policy 'PDF' blocking conversion first.
# https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion
# add <policy domain="coder" rights="read | write" pattern="PDF" /> just before </policymap> in /etc/ImageMagick-6/policy.xml
# https://stackoverflow.com/questions/2869908/convert-pdf-to-png-using-imagemagick
apt install imagemagick
convert -density 300 a.pdf -resize 25% a.png
