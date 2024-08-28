# Android
## 每日.tsk.xml
我拿來自動跑每日簽到的 Tasker 腳本
>注意，因為不是每個 APP 都能使用元件進行定位 </br>
>在一些特定 APP 中，你可能會需要根據自己手機解析度來更改腳本中絕對位置的座標 </br>
>>本人使用手機為: SONY XPERIA 1 V </br>
>> adb shell wm size -> Physical size: 1096x2560 </br>
>> adb shell wm density  -> Physical density: 420

目前支援的 APP 如下
+ 中友百貨
+ 巴哈母特
+ 蝦皮購物
+ Mo PTT
+ 4Gamers
+ ~~麥當勞~~
+ YAMAHA LIFE
+ ~~飛貓盤~~
+ HoYoLAB
+ aifian

已知問題 or 您可能需要留意
+ 在網路速度不夠快時，預設的等待時間可能會逾時
+ 修正新版蝦皮簽到

TDL
+ 針對比較常出問題的 APP 調整執行順序

