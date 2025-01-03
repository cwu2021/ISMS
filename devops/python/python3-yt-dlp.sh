sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz
tar zxvf Python-3.13.0.tgz
cd Python-3.13.0/
./configure --prefix=/opt --enable-optimizations --enable-shared LDFLAGS="-Wl,-rpath /opt/lib"
make -j $(nproc)
sudo make altinstall
/opt/bin/python3.13 --version
mkdir yt-dlp
/opt/bin/python3.13 -m venv yt-dlp
source yt-dlp/bin/activate
cd yt-dlp/
bin/pip3 install yt-dlp
yt-dlp
deactivate
