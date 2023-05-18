#!/bin/sh

#Format list without the 3 lines



FormatList=$(yt-dlp --list-formats "$1" |sed 1,3d)

#Check dependencies
if ! command -v 'yt-dlp'; then
    echo "No yt-dlp program"
    exit 1
fi
#Valid arguments:
if [ -z "$1" ]
then
    echo "No url provided"
    exit 1
fi

#Ask for video
VideoFormat=$(echo "$FormatList"|grep video|dmenu -p "Pick Video Format" -l 20|cut -d ' ' -f1)

if [ -z "$VideoFormat" ] #Logs no picked
then
    echo "No video format chosen"
fi

#Ask for audio
AudioFormat=$(echo "$FormatList"|grep audio|dmenu -p "Pick Audio Format" -l 20|cut -d ' ' -f1)

if [ -z "$AudioFormat" ] #Logs no picked
then
    echo "No audio format chosen"
else
    if [ -n "$VideoFormat" ]
    then
        VideoFormat="$VideoFormat+"
    fi
fi


if [ -z "$AudioFormat" ] && [ -z "$VideoFormat" ] #If neither are chosen executes default (Best quality)
then
    mpv --force-window=immediate "$1"
else
    mpv --ytdl-format="$VideoFormat$AudioFormat" --force-window=immediate "$1"
fi

