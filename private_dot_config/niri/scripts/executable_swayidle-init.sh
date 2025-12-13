#!/usr/bin/env bash

swayidle -w\
	timeout 300 'swaylock -f -e -c 1c1c1c'\
	timeout 330 'niri msg action power-off-monitors' resume 'niri msg action power-on-monitors'\
	timeout 600 'systemctl hibernate'\
	before-sleep 'swaylock -f -e -c 1c1c1c'
