#!/bin/bash
# debug mode samsung s20
# https://www.verizon.com/support/knowledge-base-234186/
# Settings > About phone > Software information then tap Build number 7 times.
# https://stackoverflow.com/questions/20834241/how-to-use-adb-command-to-push-a-file-on-device-without-sd-card
adb pull /mnt/sdcard/a.mp3 .
adb push a.mp3 /data/local/tmp
adb pull /mnt/sdcard/b.mp3 .
adb push b.mp3 /data/local/tmp
# browser can access internal storage via url file:///data/local/tmp/a.mp3
