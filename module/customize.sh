
CONFIG_PATH="/sdcard/Android/HChai/HC_tweaker"
[ ! -d "$CONFIG_PATH" ] && mkdir -p "$CONFIG_PATH"

# Copy config file
cp -f "$MODPATH/config/tweaker.json" "$CONFIG_PATH/tweaker.json"
rm -rf "$MODPATH/config"

rate() {
    sed -i -E "s/\"refresh_rate\": \"[0-9]+\"/\"refresh_rate\": \"$1\"/g" /sdcard/Android/HChai/HC_tweaker/tweaker.json
}

rate_from_surface=$(dumpsys SurfaceFlinger | awk '/FPS / {gsub("max:", "", $3); print $3}')
rate_from_display=$(dumpsys display | awk '/mDefaultPeakRefreshRate/ {print $2}')

if [ -n "$rate_from_surface" ]; then
    rate "$rate_from_surface"
elif [ -n "$rate_from_display" ]; then
    rate "$rate_from_display"
else
    rate 90
fi

set_perm_recursive "$MODPATH" 0 0 0755 0777

ui_print "- Restart and enjoy zygisk-Tweaker immediately"