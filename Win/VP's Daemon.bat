@echo off
@title VP的開機守護神

echo "嗨，這是VP的開機守護神"

:: 老筆電比較慢，先等它起床 
timeout 3 > NUL

if exist A:\ (
    echo "歐耶，我有 RAMDISK ！"
    git clone https://github.com/vincent5753/YT_ACV_Bot.git A:\YT_ACV_Bot\
    copy C:\ENV\Credential.ps1 A:\YT_ACV_Bot\Windows\Credential.ps1
    cd /d "A:\YT_ACV_Bot\Windows\"
    powershell -File "A:\YT_ACV_Bot\Windows\bot.ps1"
) else (
    echo "RAMDISK 死了！"
)
pause