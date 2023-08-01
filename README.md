# HBFS
## Intro/介紹
This repo is kinda like a warehouse that I put tweaks to my machines that can improve productivity for me.  
這個 repo 對我來說有點像是個放一些我對常用機器的一些調整，整體來說都是些我認為可以增進生產力的設置.

## Unix-like
原則上會是 Linux 和 MacOS 共通的調整

## Mac
`*.scpt` 為 MacOS 限定腳本 </br>
`crontab.txt` 為僅限 MacOS 能執行的 crontab

## Linux
### Ubuntu

## Win
### compress
如果時間對你不是問題，而且你需要(想要)好的壓縮比，為何不試試無腦壓壓看不同的字典大小？

TDL
+ 自動刪除多餘壓縮檔

### nirvana.bat
我的環境調整腳本，原則上灌系統才會需要它

### VP's Daemon.bat
為當前使用者設置開機啟動
```
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "VP's Daemon.bat" /t REG_SZ /F /D "C:\ENV\VP's Daemon.bat"
```

### 其他批次檔
`flac8.bat` 快速將當前目錄下的 `wav` 轉為 `flac`，使用最高壓縮比(-8) </br>
>請確保你可以使用 `flac` 指令(記得把它加到環境變數中)

`mkv.bat` 快速將當前目錄下的 `avi` 轉為 `mkv`，編碼轉為 `h265`(使用 CPU 進行編碼(如果你有 NVIDIA GPU 請使用下方註解區段))
>請確保你可以使用 `ffmpeg` 指令(記得把它加到環境變數中)

## Android
### 每日.tsk.xml
我拿來自動跑每日簽到的 Tasker 腳本
>注意，因為不是每個 APP 都能使用元件進行定位 </br>
>在一些特定 APP 中，你可能會需要根據自己手機解析度來更改腳本中絕對位置的座標 </br>
>本人使用手機為: SONY XPERIA 1 V

目前支援的 APP 如下
+ 中友百貨
+ 巴哈母特
+ 蝦皮購物
+ Mo PTT
+ 4Gamers
+ 麥當勞
+ YAMAHA LIFE
+ 飛貓盤
+ HoYoLAB
+ aifian

已知問題 or 您可能需要留意
+ 麥當當偶爾會改套件名
+ 在網路速度不夠快時，預設的等待時間可能會逾時

TDL
+ 針對比較常出問題的 APP 調整執行順序
