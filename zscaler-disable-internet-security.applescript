#!/usr/bin/env osascript


# Click Zscaler icon
tell application "System Events"
	click at {1462, 11}
end tell
delay 0.1
# Click Open Zscaler
tell application "System Events"
	click at {1505, 41}
end tell
delay 0.8
# Click Internet Security
tell application "System Events"
	click at {1348, 917}
end tell
delay 0.3
# Click OFF Button
tell application "System Events"
	click at {1870, 905}
end tell
delay 0.3
# Click OK on popup (yes I'm fucking sure)
tell application "System Events"
	click at {1168, 436}
end tell
delay 1.5
# Click close button
tell application "System Events"
	click at {1292, 689}
end tell
