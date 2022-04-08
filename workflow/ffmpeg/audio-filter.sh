#!/bin/bash
# Denoises audio samples with FFT
# https://superuser.com/questions/733061/reduce-background-noise-and-optimize-the-speech-from-an-audio-clip-using-ffmpeg
# http://ffmpeg.org/ffmpeg-filters.html#afftdn
# https://video.stackexchange.com/questions/29274/how-can-you-use-ffmpegs-afftdn-sn-flag-to-sample-noise-from-a-reference-noise
ffmpeg -i $input -af "asendcmd=c='0.0 afftdn@n sn start; 1.0 afftdn@n sn stop',afftdn@n" noiseout.wav
