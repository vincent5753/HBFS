# Mac
## 基本說明
`*.scpt` 為 macOS 限定腳本 </br>
`crontab.txt` 為僅限 macOS 能執行的 crontab

## 鍵盤按鍵映射
`com.local.KeyRemapping.plist` 用於透過 hidutil 進行鍵盤按鍵映射 (Key Remapping)
|來源按鍵 (Source)|目標按鍵 (Destination)|說明|
|-|-|-|
|0x0C00000221|0xFF00000009|將 Spotlight (搜尋圖案)換為減少鍵盤亮度|
|0x0C000000CF|0xFF00000008|將 Dictation (麥克風圖案) 換為增加鍵盤亮度|

安裝
```
# 複製
sudo cp com.local.KeyRemapping.plist /Library/LaunchAgents/com.local.KeyRemapping.plist

# 設定檔案權限
sudo chown root:wheel /Library/LaunchDaemons/com.local.keyRemapping.plist
sudo chmod 644 /Library/LaunchDaemons/com.local.keyRemapping.plist

# 設定開機啟用
sudo launchctl bootstrap system /Library/LaunchDaemons/com.local.KeyRemapping.plist

# 載入 plist
sudo launchctl load /Library/LaunchDaemons/com.local.KeyRemapping.plist
```

如果你想更改其他按鍵，可以參考 [hidutil key remapping generator for MacOS](https://hidutil-generator.netlify.app/)
