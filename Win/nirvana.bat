rem ¶Â·t¼Ò¦¡ / Dark Mode
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t reg_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t reg_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUseLightTheme" /t reg_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUseLightTheme" /t reg_DWORD /d "0" /f