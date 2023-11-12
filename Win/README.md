# Windows
## compress
如果時間對你不是問題，而且你需要(想要)好的壓縮比，為何不試試無腦壓壓看不同的字典大小？
這個子專案會自動壓縮並刪除多餘的壓縮檔，結論就是你能夠獲得(大概是)最小的壓縮檔
>註: 你會需要把 `7z` 加入 `環境變數`

TDL
+ (於壓縮檔案大小遞減時)自動刪除多餘壓縮檔

## nirvana.bat
我的環境調整腳本，原則上灌系統才會需要它

## VP's Daemon.bat
開機就會幫我卡著的開機守護神 :)

為當前使用者設置開機啟動
```
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "VP's Daemon.bat" /t REG_SZ /F /D "C:\ENV\VP's Daemon.bat"
```

## 其他批次檔
`flac8.bat` 快速將當前目錄下的 `wav` 轉為 `flac`，使用最高壓縮比(-8) </br>
>請確保你可以使用 `flac` 指令(記得把它加到環境變數中)

`mkv.bat` 快速將當前目錄下的 `avi` 轉為 `mkv`，編碼轉為 `h265`(使用 CPU 進行編碼(如果你有 NVIDIA GPU 請使用下方註解區段))
>請確保你可以使用 `ffmpeg` 指令(記得把它加到環境變數中)
