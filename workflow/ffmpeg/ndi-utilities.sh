sudo apt update
sudo apt install git
git clone https://github.com/lplassman/FFMPEG-NDI
# ffmpeg for ndi may not work for n6.1 and n7.0
# cd ffmpeg; git checkout n5.1
sudo bash FFMPEG-NDI/preinstall.sh
sudo bash FFMPEG-NDI/install-ndi-x86_64.sh
cd 'NDI SDK for Linux/examples/C++' && make
## Usage for FFMPEG with NDI
# List all sources on the network
# ffmpeg -f libndi_newtek -find_sources 1 -i dummy
