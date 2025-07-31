#!/bin/bash

# do this on your app first
# open "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"

# Launch first instance (vp)
nohup /Applications/BlueStacks.app/Contents/MacOS/BlueStacks --instance Tiramisu64 --cmd launchApp --package "com.gof.global" > /dev/null 2>&1 &

# Wait for first instance to fully load
sleep 3

# Position first window
osascript \
-e 'tell application "System Events"' \
-e 'tell process "BlueStacks"' \
-e 'set frontmost to true' \
-e 'delay 1' \
-e 'try' \
-e 'set position of window 1 to {432, 44}' \
-e 'on error errMsg' \
-e 'display dialog "Error positioning window 1: " & errMsg' \
-e 'end try' \
-e 'end tell' \
-e 'end tell'

# Launch second instance
nohup /Applications/BlueStacks.app/Contents/MacOS/BlueStacks --instance Tiramisu64_1 --cmd launchApp --package "com.gof.global" > /dev/null 2>&1 &

# Wait for second instance to fully load
sleep 3

# Position second window - target by PID or find the newest window
osascript \
-e 'tell application "System Events"' \
-e 'set blueStacksProcesses to every process whose name is "BlueStacks"' \
-e 'repeat with proc in blueStacksProcesses' \
-e 'tell proc' \
-e 'set frontmost to true' \
-e 'delay 0.5' \
-e 'try' \
-e 'set windowCount to count windows' \
-e 'if windowCount > 0 then' \
-e 'repeat with i from 1 to windowCount' \
-e 'try' \
-e 'set currentPos to position of window i' \
-e 'if currentPos is not {432, 44} then' \
-e 'set position of window i to {969, 426}' \
-e 'exit repeat' \
-e 'end if' \
-e 'on error' \
-e 'end try' \
-e 'end repeat' \
-e 'end if' \
-e 'on error errMsg' \
-e 'end try' \
-e 'end tell' \
-e 'end repeat' \
-e 'end tell'
