@echo off
@title VP���}���u�@��

echo "�١A�o�OVP���}���u�@��"

:: �ѵ��q����C�A�������_�� 
timeout 3 > NUL

if exist A:\ (
    echo "�ڭC�A�ڦ� RAMDISK �I"
    git clone https://github.com/vincent5753/YT_ACV_Bot.git A:\YT_ACV_Bot\
    copy C:\ENV\Credential.ps1 A:\YT_ACV_Bot\Windows\Credential.ps1
    cd /d "A:\YT_ACV_Bot\Windows\"
    powershell -File "A:\YT_ACV_Bot\Windows\bot.ps1"
) else (
    echo "RAMDISK ���F�I"
)
pause