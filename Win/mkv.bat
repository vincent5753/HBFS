@echo off
@title Converting avi to mkv...
FOR %%f IN (*.avi) DO ffmpeg -i "%%f" -c:v libx265 -preset slow -c:a flac -y "%%~nf.mkv"
rem If you have a nvidia card, use the following code instead.
rem FOR %%f IN (*.avi) DO ffmpeg -i "%%f" -c:v hevc_nvenc -preset slow -c:a flac -y "%%~nf.mkv"
