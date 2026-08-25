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

以 **LaunchAgent** (`~/Library/LaunchAgents/`) 安裝，登入後才執行。</br>
不要放在 LaunchDaemons：daemon 在開機早期、使用者登入前就執行，那時鍵盤常常還沒被 HID 列舉完，hidutil 會套用失敗，導致映射時靈時不靈。

安裝
```
# 複製 (放使用者目錄，全程不需要 sudo)
cp com.local.KeyRemapping.plist ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# 設定檔案權限
chmod 644 ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# 載入 (RunAtLoad 會立刻套用一次，之後每次登入自動套用)
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.local.KeyRemapping.plist
```

重新載入 (改完 plist 內容後執行)
```
launchctl kickstart -k gui/$(id -u)/com.local.KeyRemapping
```

移除
```
launchctl bootout gui/$(id -u)/com.local.KeyRemapping
rm ~/Library/LaunchAgents/com.local.KeyRemapping.plist
hidutil property --set '{"UserKeyMapping":[]}'
```

### 疑難排解
先確認目前實際生效的映射
```
hidutil property --get "UserKeyMapping"
```
- 回傳 `(null)` 或空清單 → 映射沒套上，執行上面的 kickstart 重新載入
- 有內容卻按不動 → 不是 hidutil 的問題，通常是其他 app (如 Karabiner、Logi Options+) 攔截了按鍵

檢查 agent 狀態
```
launchctl print gui/$(id -u)/com.local.KeyRemapping
```
`state = not running` 是正常的 —— hidutil 是跑完就結束的一次性指令，不是常駐程序，看 `last exit code = 0` 即為成功。

也可以不透過 launchd，直接套用一次測試 (重開機後失效)
```
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x0C00000221,"HIDKeyboardModifierMappingDst":0xFF00000009},{"HIDKeyboardModifierMappingSrc":0x0C000000CF,"HIDKeyboardModifierMappingDst":0xFF00000008}]}'
```

如果你想更改其他按鍵，可以參考 [hidutil key remapping generator for MacOS](https://hidutil-generator.netlify.app/)
