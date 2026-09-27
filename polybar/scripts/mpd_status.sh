#!/usr/bin/env bash

# Verificar si MPD responde
if ! mpc status >/dev/null 2>&1; then
    echo "%{F#666666}MPD offline%{F-}"
    exit 0
fi

STATUS=$(mpc status | sed -n '2p' | awk '{print $1}')

if [ "$STATUS" = "[playing]" ]; then
    ICON="%{F#ff2a85}󰎈%{F-}"
    TEXT=$(mpc current -f "%artist% - %title%")
    # Fallback si las etiquetas están vacías
    if [ -z "$TEXT" ]; then
        TEXT=$(mpc current -f "%file%")
    fi
    echo "$ICON $TEXT"
elif [ "$STATUS" = "[paused]" ]; then
    ICON="%{F#666666}󰏤%{F-}"
    TEXT=$(mpc current -f "%artist% - %title%")
    echo "$ICON %{F#666666}$TEXT%{F-}"
else
    echo "%{F#666666}󰐊 Stopped%{F-}"
fi
