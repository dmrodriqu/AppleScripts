-- author: Dylan Rodriquez
-- v1 Jan 4, 2017


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
		-- set position of window to a constant spot
		-- next iteration to place in center of screen
		-- (get dimensions of screen h/2, w/2, set pos)
		set position of window 1 to {1043, 243} 
		-- accessibility does not show UI elements in this
		-- applications. using exit button for reference of all other
		-- buttons
		tell button 0 of window 1
			set p to position
			-- setting position of conference name
			set x to (item 1 of p) + 10
			set y to (item 2 of p) + 90
			set sep to ","
		end tell
	end tell
end tell

tell application "Terminal"
	activate
	delay 1
	-- requires packages cliclick (brew install cliclick)
	do script ("cliclick c:" & x & sep & y)
	-- in next iteration, will not need a predefined value
	-- use button 0 as frame of reference
	do script ("cliclick c:1762,463")
end tell

tell application "System Events"
	tell process "VidyoDesktop"
		-- new window open, window 1 is now conference settings
		tell button 0 of window 1
			-- same approach as before
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