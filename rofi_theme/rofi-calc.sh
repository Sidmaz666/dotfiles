#!/bin/bash
ol="$(rofi -show calc -modi calc -no-show-match -no-sort -theme gruvbox-dark )" ; mol="$(echo "$ol")" ; copyq add $ol
