<div align="center">
<h1>Tweaker</h1>
<a href="http://cppmicroservices.org/"><img alt="C Language" src="https://img.shields.io/badge/-C-black?logo=c&style=flat-square&logoColor=ffffff"></a>
<a href="http://cppmicroservices.org/"><img alt="C++ Language" src="https://img.shields.io/badge/-C++-808080?logo=c%2B%2B&style=flat-square&logoColor=ffffff"></a>
<a href="https://www.python.org/"><img alt="Bash Shell" src="https://img.shields.io/badge/-Bash-ae9a5a?style=flat-square&logo=shell&logoColor=ffffff"></a>
<img alt="Android Support" src="https://img.shields.io/badge/Android%208~14-Support-green">
<img alt="arm64-v8a Support" src="https://img.shields.io/badge/arm64--v8a-Support-green">
<a href="https://t.me/HCha1234"><img alt="加入电报频道" src="https://img.shields.io/badge/Join%20group-Telegram-brightgreen.svg?logo=telegram"></a>
<p><b><a href="README.md">English</a> | <a href="README-zh.md">简体中文</a></b></p>
<p>Reads a JSON configuration to disguise the device model and unlock high frame rates for specified applications. Automatically detects the device refresh rate to match suitable device models. Customizes the FPS and resolution for Unity games by calling functions. Difficult to detect with zygisk implementation.</p>
</div>

## ✨Key Features
- Disguises device model to achieve high frame rates
- Customizes FPS and resolution for Unity games

## 💡Instructions
- Enabling zygisk is required to use this module
- This module supports Android 8 ~ 14, with platform support for arm64-v8a and armeabi-v7a
- Magisk version should be 20.4+ and ksu is mostly compatible
- This module has minimal conflicts with device model modules

## 📝Custom Configuration
- JThe JSON configuration file is located at`/sdcard/Android/HChai/HC_tweaker/tweaker.json`
- After modifying the configuration, it is recommended to use a JSON syntax checking tool to ensure there are no syntax errors. If there is no effect, execute `logcat | grep "ZygiskTweaker"`` in the terminal to view the error reason. Note that after executing this command, you need to open the application to output logs.

JSON configuration example：  
```json
{
    "project": {
        "author": "火機@coolapk",
        "name": "Official Configuration [23.11.02]"
    },
    "modules": {
        "settings": {
            "fps_unlock": true, // Enable unlocking high frame rates. If set to false, the game will not have its frame rate unlocked, but device model disguising will still work for Game mode and Unity mode.
            "refresh_rate": "144" // Refresh rate. The module will automatically detect the device refresh rate upon installation, but you can also manually modify it.
        },
        "game": [
            {
                "package": ["com.riotgames.league.teamfighttactics", "com.tencent.jkchess"], // Game package name(s) in an array format. You can specify multiple packages.
                "tweaker" : [
                    {
                        "rate": 144, // Frame rate as a number
                        "brand": "Lenovo", // Brand
                        "model": "Lenovo TB320FC", // Device model
                        "device": "" // Device name (optional). Brand and model must be specified.
                    },
                    {
                        "rate": [90,120], // Frame rate as an array. You can specify multiple frame rates.
                        "brand": "Xiaomi", // Brand
                        "model": "23046RP50C", // Device model
                        "device": "" // Device name (optional). Brand and model must be specified.
                    }
                ]
            },
            {
                "package": "com.tencent.tmgp.sgame", // Game package name as a string. You can only specify one package.
                "tweaker" : [
                    {
                        "rate": 120, // Frame rate as a number
                        "brand": "Nubia", // Brand
                        "model": "NX729J", // Device model
                        "device": "" // Device name (optional). Brand and model must be specified.
                    }
                ]
            }
        ],
        "unity": [
            {
                "package": ["com.riotgames.league.teamfighttactics", "com.tencent.jkchess"], // Game package name(s) in an array format. You can specify multiple packages, or use a string format like in the 'game' section.
                "settings": {
                    "fps": 144, // Frame rate as a number
                    "time": 15, // Delay time in seconds
                    "width": 0, // Width of resolution. 0 means no modification.
                    "height": 0, // Height of resolution. 0 means no modification.
                    "lock_fps": false // Whether to lock the frame rate. Set to true for forced lock, false for no lock.
                }
            }
        ]
    }
}
```

-  In the `game` and `unity` settings, you can enter multiple or single values for package. Please be aware that replacing `lock_fps` with an empty implementation using Dobby may result in an account ban.


## 🔍Frequently Asked Questions

Unity FPS unlock is not working or causing crashes
- If it causes crashes, it means that the game has detected it. If it doesn't work, it means that the game does not support it. You can try setting `lock_fps` to `true`. If it still doesn't work, it means that the game does not support it.

What is the difference between `game` and `unity`?
- `game` disguises the device model for games to unlock high frame rates, while `unity` forces FPS and resolution modifications for Unity games.

If `refresh_rate` is set to 144, but the disguised device models do not support 144, what happens?
- It will automatically lower the frame rate to the closest supported value. For example, if there are two device models, one supports 120 and the other supports 90, then 144 will be lowered to 120. If there is no support for 120, then it will be lowered to 90.

## Supported games
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
- 原神(com.miHoYo.Yuanshen) [强制解锁] 默认90
- Honkai Star Rail(com.miHoYo.GenshinImpact) [强制解锁] 默认90

## 🚀Download
- [Go to Github for download](https://github.com/OneB1ank/zygisk-Tweaker/releases)

## 🌟Star History

<a href="https://star-history.com/#OneB1ank/zygisk-Tweaker&Timeline">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=OneB1ank/zygisk-Tweaker&type=Timeline&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=OneB1ank/zygisk-Tweaker&type=Timeline" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=OneB1ank/zygisk-Tweaker&type=Timeline" />
  </picture>
</a>

Thanks to the following users for their testing feedback and bug identification:
- @火機(coolapk)

## 🎉Support Donations
If you find this module useful, you can make a donation to support me.
- [爱发电](https://afdian.net/a/HCha1)
- USDT(TRC20)
  > Address: TSqTqn2NcyUAbEwsdGgsrYoU5pokno5PnQ
