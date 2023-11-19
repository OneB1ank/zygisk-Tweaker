#!/system/bin/sh
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

# 定义模块目录
MODDIR="$(dirname "$0")"
COUNT=0

# 等待设备完成引导
while [ "$(getprop sys.boot_completed)" != "1" ] && [ $COUNT -lt 3]; do
    sleep 10
    COUNT=$((COUNT+1))
done

adjustPermissions() {
    local dir="$1"
    chmod u+r,u+w,g+r,g+w,o+r,o+w "$dir"
}

adjustPermissions "/data/media/0/Android/HChai/HC_tweaker"