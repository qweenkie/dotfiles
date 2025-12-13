#!/usr/bin/env bash

WALLDIR="$HOME/.local/share/wallpapers/"
INTERVAL=300 # 5 mins

if [[ ! -d "$WALLDIR" ]]; then
	exit 1
fi

while true; do
	WALLPAPER="$(find "$WALLDIR" -type f | shuf -n 1)"
	if [[ -n WALLPAPER ]]; then
		pkill swaybg
		swaybg -i "$WALLPAPER" &
	fi

	sleep $INTERVAL
done
