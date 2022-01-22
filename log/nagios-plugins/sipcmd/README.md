# sipcmd - the command line SIP/H.323/RTP softphone
(copied from Google cache of http://sipcmd.sourceforge.net/)

## Introduction

Command line soft phone that makes phone calls, accepts calls, enters DTMF digits, plays back WAV files and records them. A useful testing tool for VoIP systems. Runs on Linux.

## NEWS

30th Aug, 2012: Source code moved to GitHub

30th Aug, 2012: Updated to use latest versions of Opal and PTlib available on apt repos for Ubuntu 12.04

## HOWTO

###Dependencies

apt-get install opal-dev and ptlib-dev

###Download

Get source code from GitHub

###Compile

make

###Environment


If you compile the dependencies from source (don't), make sure that libpt and libopal are in your LD_LIBRARY_PATH. The default installation location is /usr/local/lib.

###Run

testphone options:

-u  --user          username (required)
-a  --alias         username alias
-l  --localaddress  local address to listen on
-p  --listenport    the port to listen on
-r  --remoteparty   the party to call to
-x  --execute       program to follow
-d  --audio-prefix  recorded audio filename prefix
-f  --file          the name of played sound file
-g  --gatekeeper    gatekeeper to use
-w  --gateway       gateway to use

-l or -p without -x assumes answer mode. Additional -r forces caller id checking. -r without -l, -p or -x assumes call mode.

WAV file requirements:

    mono
    8 kHz sampling rate
    16 bits sample size 

The EBNF definition of the program syntax:

prog	:=  cmd ';'  |
cmd	:=  call | answer | hangup
	  | dtmf | voice | record | wait
	  | setlabel | loop
call	:=  'c' remoteparty
answer	:=  'a' [ expectedremoteparty ]
hangup	:=  'h'
dtmf	:=  'd' digits
voice	:=  'v' audiofile
record	:=  'r' [ append ] [ silence ] [ iter ] millis audiofile
append	:=  'a'
silence	:=  's'
closed	:=  'c'
iter	:=  'i'
activity:=  'a'
wait	:=  'w' [ activity | silence ] [ closed ] millis
setlabel:=  'l' label
loop	:=  'j' [ how-many-times ] [ 'l' label ]

Example:

"l4;c333;ws3000;d123;w200;lthrice;ws1000;vaudio;rsi4000f.out;j3lthrice;h;j4"

Parses to the following:

    do this four times:
        call to 333
        wait until silent (max 3000 ms)
        send dtmf digits 123
        wait 200 ms
        do this three times:
            wait until silent (max 1000 ms)
            send sound file 'audio'
            record until silent (max 4000 ms) to files 'f-[0-3]-[0-2].out' 
        hangup
        wait 2000 ms 
