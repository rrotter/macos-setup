#!/usr/bin/osascript
(* Disable True Tone and automatic display brightness
 * 
 * This may need some adjustment for multi-display setups and displays that
 * lack one or both of these "features".
 *)

global app_name
set app_name to "System Settings"

do shell script "open x-apple.systempreferences:com.apple.preference.displays"

tell application "System Events"
	tell process app_name
		-- wait for Displays prefpane to load
		repeat until exists group 1 of window "Displays"
		end repeat
		
		tell window "Displays"
			tell group 2 of scroll area 2 of group 1 of group 2 of splitter group 1 of group 1
				set my_checkbox to get checkbox "True Tone"
				tell my_checkbox
					if value as boolean then
						click
					end if
				end tell
				set my_checkbox to get checkbox "Automatically adjust brightness"
				tell my_checkbox
					if value as boolean then
						click
					end if
				end tell
			end tell
			display dialog "Adjust the screen resolution as desired." buttons {"Exit Setup", "Continue Setup"} cancel button "Exit Setup" default button "Continue Setup"
			-- close settings window
			click button 1
		end tell
	end tell
end tell

return
