rem 黑暗模式 / Dark Mode
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t reg_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t reg_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUseLightTheme" /t reg_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUseLightTheme" /t reg_DWORD /d "0" /f
rem 讚讚ㄉ透明 / Transparency Effects
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t reg_DWORD /d "1" /f
rem 不要模糊效果 / No Blur Effects
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableBlurBehind" /t reg_DWORD /d "0" /f
rem 工作列顏色跟著變 / Colorized Taskbar without colorized Start Menu and Action Center
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t reg_DWORD /d "1" /f
rem 工作列時鐘顯示秒數 / Show Seconds In Taskbar SystemClock
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t reg_DWORD /d "1" /f
rem 透明ㄉ工作列 / Transparent Taskbar
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t reg_DWORD /d "1" /f