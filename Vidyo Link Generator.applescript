-- a small script to automate the generation of links after every meeting
-- to mitigate security issues.
activate application "Finder"
activate application "VidyoDesktop"
delay 3
tell application "System Events"
	tell process "VidyoDesktop"
		keystroke " " -- portal goes here
		keystroke tab
		keystroke " " -- username goes here
		keystroke tab
		keystroke " " -- password goes here
		keystroke return
	end tell
end tell

activate application "VidyoDesktop"
tell application "System Events"
	tell process "VidyoDesktop"
		set position of window 1 to {1043, 243}
		tell button 0 of window 1
			set p to position
			set x to (item 1 of p) + 10
			set y to (item 2 of p) + 90
			set sep to ","
		end tell
	end tell
end tell

tell application "Terminal"
	activate
	delay 1
	do script ("cliclick c:" & x & sep & y)
	do script ("cliclick c:1762,463")
end tell

tell application "System Events"
	tell process "VidyoDesktop"
		tell button 0 of window 1
			set p to position
			set x2 to (item 1 of p) + 25
			set y2 to (item 2 of p) + 187
			set x3 to x2 + 239
			set y3 to y2 - 46
		end tell
	end tell
end tell

tell application "Terminal"
	activate
	delay 7
	do script ("cliclick c:" & x2 & sep & y2)
	do script ("cliclick c:" & x3 & sep & y3)
end tell