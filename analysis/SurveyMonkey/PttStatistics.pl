# run python 2.7 and pip on focal:
$python2 = `sudo apt install python2`;
# stackoverflow/how-to-install-pip-for-python-2
$pypa = `curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py`;
$pip2 = `sudo python2 get-pip.py`;
# stackoverflow/importerror-no-module-named-requests
$modules = `sudo pip install requests jieba bs4`;

=begin endnote
git clone https://github.com/twtrubiks/PttStatistics
python2 PttStatistics.py title gossiping 100

輿情分析全攻略
https://choose.blueplanet.com.tw/
https://mdigi.net/public-opinion-analysis/