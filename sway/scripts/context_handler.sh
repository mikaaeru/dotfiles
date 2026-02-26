#!/bin/bash

WINDOW_INFO=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | "\(.app_id) \(.window_properties.class)"')
IS_CHROME=$(echo "${WINDOW_INFO,,}" | grep -Ei "chromium|chrome|brave|brave-browser|brave-browser-beta")

case "$1" in
    close)
        if [ -n "$IS_CHROME" ]; then
            wtype -M ctrl w
        else
            swaymsg kill
        fi
        ;;
    new_tab)
        if [ -n "$IS_CHROME" ]; then
            wtype -M ctrl t
        else
            swaymsg layout tabbed
        fi
        ;;
    refresh)
        if [ -n "$IS_CHROME" ]; then
            wtype -M ctrl r
        else
            swaymsg mode "resize"
        fi
        ;;
esac
