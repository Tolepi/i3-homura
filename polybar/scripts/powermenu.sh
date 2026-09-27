#!/usr/bin/env bash

# Opciones con iconos de Nerd Fonts / Font Awesome
CHOSEN=$(printf "󰐥 Apagar\n󰜉 Reiniciar\n󰤄 Suspender\n󰍃 Cerrar Sesión" | rofi -dmenu -i -p "Power Menu" -theme-str '
    window {
        width: 430px;
        border: 2px;
        border-color: #ff2a85;
        background-color: #000000;
        font: "Terminess Nerd Font 10";
    }
    mainbox {
        children: [ listview ];
        padding: 10px;
        background-color: #000000;
    }
    listview {
        lines: 4;
        background-color: #000000;
    }
    element {
        padding: 6px;
        text-color: #ffffff;
        background-color: #000000;
    }
    element selected {
        background-color: #ff2a85;
        text-color: #000000;
    }
')

case "$CHOSEN" in
    "󰐥 Apagar") doas poweroff ;;
    "󰜉 Reiniciar") doas reboot ;;
    "󰤄 Suspender") zzz ;; # o loginctl suspend
    "󰍃 Cerrar Sesión") i3-msg exit ;;
esac
