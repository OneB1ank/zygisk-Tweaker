<div align="center">
<h1>Tweaker</h1>
<a href="http://cppmicroservices.org/"><img alt="C Language" src="https://img.shields.io/badge/-C-black?logo=c&style=flat-square&logoColor=ffffff"></a>
<a href="http://cppmicroservices.org/"><img alt="C++ Language" src="https://img.shields.io/badge/-C++-808080?logo=c%2B%2B&style=flat-square&logoColor=ffffff"></a>
<a href="https://www.python.org/"><img alt="Bash Shell" src="https://img.shields.io/badge/-Bash-ae9a5a?style=flat-square&logo=shell&logoColor=ffffff"></a>
<img alt="Android Support" src="https://img.shields.io/badge/Android%208~14-Support-green">
<img alt="arm64-v8a Support" src="https://img.shields.io/badge/arm64--v8a-Support-green">
<a href="https://t.me/HCha1234"><img alt="加入电报频道" src="https://img.shields.io/badge/Join%20group-Telegram-brightgreen.svg?logo=telegram"></a>
<p><b><a href="README.md">English</a> | <a href="README-zh.md">简体中文</a></b></p>
<p>读取Json配置来对指定应用伪装机型解锁游戏高帧率，自动获取本机刷新率来伪装适合的机型，对unity游戏call函数可自定义fps和分辨率。zygisk实现不易被检测。</p>
</div>

## ✨重要功能
- 机型伪装实现高帧率
- 对unity游戏可自定义fps和分辨率

## 💡说明
- 使用本模块需要开启zygisk
- 该模块支持Android8 ~ 14，平台支持arm64-v8a，armeabi-v7a
- Magisk不低于20.4+，ksu大部分可兼容
- 此模块基本不会与机型模块产生冲突

## 📝自定义配置
- JSON配置文件位于`/sdcard/Android/HChai/HC_tweaker/tweaker.json`
- 修改配置后建议使用JSON格式检查工具检查是否有语法错误，如遇到无效果请用在终端执行`logcat | grep "ZygiskTweaker"`查看错误原因，注意执行该命令后需要打开应用才会有日志输出。

JOSN配置参考：  
```json
{
    "project": {
        "author": "火機@coolapk",
        "name": "官方配置 [23.11.02]"
    },
    "modules": {
        "settings": {
            "fps_unlock": true, //开启强制解锁高帧率，如果为false则不会对游戏进行帧率解锁，但game机型伪装会生效，unity不会生效。
            "refresh_rate": "144" //刷新率，每次安装模块会自动获取本机刷新率，也可以手动修改
        },
        "game": [
            {
                "package": ["com.riotgames.league.teamfighttactics", "com.tencent.jkchess"], //游戏包名，数组形式，可以填写多个
                "tweaker" : [
                    {
                        "rate": 144, //帧率，这个是数字类型
                        "brand": "Lenovo", //品牌
                        "model": "Lenovo TB320FC", //机型
                        "device": "" //设备名，可填可不填，但brand和model必须填写
                    },
                    {
                        "rate": [90,120], //帧率，这个是数组类型，可以填写多个
                        "brand": "Xiaomi", //品牌
                        "model": "23046RP50C", //机型
                        "device": "" //设备名，可填可不填，但brand和model必须填写
                    }
                ]
            },
            {
                "package": "com.tencent.tmgp.sgame", //游戏包名，字符串形式，只能填写一个
                "tweaker" : [
                    {
                        "rate": 120, //帧率，这个是数字类型
                        "brand": "Nubia", //品牌
                        "model": "NX729J", //机型
                        "device": "" //设备名，可填可不填，但brand和model必须填写
                    }
                ]
            }
        ],
        "unity": [
            {
                "package": ["com.riotgames.league.teamfighttactics", "com.tencent.jkchess"], //游戏包名，数组形式，可以填写多个，也可以像game内的那样填写字符串形式
                "settings": {
                    "fps": 144, //帧率，这个是数字类型
                    "time": 15, //延迟时间，单位秒
                    "width": 0, //分辨率宽，0为不修改
                    "height": 0, //分辨率高，0为不修改
                    "lock_fps": false //是否锁定帧率，true为强制锁定，false为不锁定
                }
            }
        ]
    }
}
```

- 需要注意的是`game`和`unity`内的`package`可以填写多个，也可以填写单个。特别注意`lock_fps`使用Dobby替换为空实现，可能会导致封号。

## 🔍常见问题

unity fps强制解锁后无效或者闪退
- 如果闪退那就说明被游戏检测到了，如果无效那就是游戏不支持，可以尝试修改`lock_fps`为`true`，如果还是无效那就是游戏不支持。

game和unity的区别
- game是对游戏进行机型伪装来解锁高帧率，unity是对unity游戏进行fps和分辨率强制修改。

如果`refresh_rate`高帧率144，但是伪装的机型不支持144会怎么样？
- 会自动降低到最接近的帧率，比如有两个机型，一个是120，一个是90，那么144会降低到120，如果没有120，那么会降低到90。


- 金铲铲之战(com.tencent.jkchess) [伪装] 支持165,144,120,90
- TFT(com.riotgames.league.teamfighttactics) [伪装] 支持165,144,120,90
- 王者荣耀(com.tencent.tmgp.sgame) [伪装] 支持120,90
- 和平精英(com.tencent.tmgp.pubgmhd) [伪装] 支持90
- Call of Duty(com.activision.callofduty.shooter) [伪装] 支持120,90
- 決勝時刻(com.tencent.tmgp.codm) [伪装] 支持120,90
- 使命召唤手游(com.tencent.tmgp.cod) [伪装] 支持120,90
- 英雄联盟手游(com.tencent.lolm) [伪装] 支持120,90
- 火影忍者(com.tencent.KiHan) [伪装] 支持120,90
- 穿越火线手游(com.tencent.tmgp.cf) [伪装] 支持120,90
- 高能英雄(com.tencent.tmgp.gnyx) [伪装] 支持90
- PUBGm(com.tencent.ig) [伪装] 支持90
- 暗区突围(com.tencent.mf.uam) [伪装] 支持120,90
- QQ飞车(com.tencent.tmgp.speedmobile) [伪装] 支持144,120,90
- 金铲铲之战(com.tencent.jkchess) [强制解锁] 默认144
- TFT(com.riotgames.league.teamfighttactics) [强制解锁] 默认144

## 🚀下载
- [前往Github下载](https://github.com/OneB1ank/zygisk-Tweaker/releases)

## 🌟收藏趋势

<a href="https://star-history.com/#OneB1ank/zygisk-Tweaker&Timeline">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=OneB1ank/zygisk-Tweaker&type=Timeline&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=OneB1ank/zygisk-Tweaker&type=Timeline" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=OneB1ank/zygisk-Tweaker&type=Timeline" />
  </picture>
</a>

感谢以下用户的测试反馈和错误定位：
- @火機(coolapk)

## 🎉捐赠支持
如何你觉得这个模块很好用，可以捐赠来支持我
- [爱发电](https://afdian.net/a/HCha1)
- USDT(TRC20)
  > 地址: TSqTqn2NcyUAbEwsdGgsrYoU5pokno5PnQ
