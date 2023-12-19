#!/usr/bin/osascript
on run argv
    set targetURL to item 1 of argv
    tell application "Google Chrome"
        set theWindows to every window
        repeat with theWindow in theWindows
            set theTabs to every tab of theWindow
            repeat with theTab in theTabs
                if the URL of theTab contains targetURL then
                    reload theTab
                end if
            end repeat
        end repeat
    end tell
end run
