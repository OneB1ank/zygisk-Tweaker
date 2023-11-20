#
#Copyright (C) 2022-2023 OneB1ank
#
#This program is free module: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program. If not, see <http://www.gnu.org/licenses/>.
#
CONFIG_PATH="/sdcard/Android/HChai/HC_tweaker"
[ ! -d "$CONFIG_PATH" ] && mkdir -p "$CONFIG_PATH"

# Copy config file
cp "$MODPATH/config/tweaker.json" "$CONFIG_PATH/tweaker.json"
set_perm_recursive "$MODPATH" 0 0 0755 0777
$MODPATH/Json
rm -rf "$MODPATH/Json" "$MODPATH/config"

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



ui_print "- Restart and enjoy zygisk-Tweaker immediately"