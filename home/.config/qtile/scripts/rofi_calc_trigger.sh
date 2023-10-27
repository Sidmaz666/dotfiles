#!/bin/bash
PROMPT="$(rofi -show calc -modi calc -no-show-match -no-sort -theme gruvbox-dark )";
VALUE="$(echo "$PROMPT")" ; copyq add $PROMPT
