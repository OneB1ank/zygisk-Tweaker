
set -e

MODPATH=${0%/*}
CURRENT_DATE=$(date +%Y-%m-%d)

init() {
    cd $MODPATH/module
    echo "- 切换到模块路径"
}

packaged_Modules() {
    zip -r -9 "zygisk-Tweaker-$CURRENT_DATE.zip" *
    mv -f "zygisk-Tweaker-$CURRENT_DATE.zip" "../build/"
    echo "- 打包成功，模块名" "zygisk-Tweaker-$CURRENT_DATE.zip"
}

init
packaged_Modules