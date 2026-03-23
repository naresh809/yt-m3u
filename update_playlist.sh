#!/bin/bash

OUTPUT="playlist.m3u"
TMP="playlist.tmp"

echo "#EXTM3U" > $TMP

URLS=(
"https://www.youtube.com/watch?v=6W65z20DXkY"
"https://www.youtube.com/watch?v=6W65z20DXkY"
)
yt-dlp -U

for URL in "${URLS[@]}"
do
    yt-dlp \
    --quiet \
    --skip-download \
    --playlist-end 10 \
    --print "%(title)s|%(url)s" \
    "$URL" | while IFS="|" read -r title link
    do
        echo "#EXTINF:-1,$title" >> $TMP
        echo "$link" >> $TMP
    done
done

mv $TMP $OUTPUT
