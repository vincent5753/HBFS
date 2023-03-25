@echo off
FOR %%f IN (*.wav) DO flac -8 -o "%%~nf.flac" "%%f"