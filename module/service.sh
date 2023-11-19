#!/system/bin/sh


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