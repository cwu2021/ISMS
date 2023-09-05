# https://stackoverflow.com/questions/2454149/detect-destination-of-shortened-or-tiny-url
# for Python 3.x you can do this
import urllib.request as urlreq
link = urlreq.urlopen("http://www.google.com")
fullURL = link.url
# The posted solution only work for Python 2.x,
# >>> import urllib
# >>> resp = urllib.urlopen('http://bit.ly/bcFOko')
# >>> resp.getcode()
# 200
# >>> resp.url
# 'http://mrdoob.com/lab/javascript/harmony/'
