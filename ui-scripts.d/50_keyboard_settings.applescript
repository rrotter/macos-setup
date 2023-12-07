#!/usr/bin/osascript
(* Keyboard settings
 * 
 * Enable dictation
 * Disable auto correct, smartquotes, and awful things
 * todo: set dictation languages
 *)

global app_name
set app_name to "System Settings"

do shell script "open x-apple.systempreferences:com.apple.preference.keyboard"

tell application "System Events"
	tell process app_name
		-- wait for prefpane to load
		repeat until exists group 1 of window "Keyboard"
		end repeat
		
		tell window "Keyboard"
			-- enable Dictation
			set my_checkbox to checkbox 1 of group 4 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
			if not (value of my_checkbox as boolean) then
				click my_checkbox
				-- wait for slow sheet animation
				repeat until (exists sheet 1)
				end repeat
				click button "Enable" of sheet 1
			end if
			-- wait for slow sheet animation
			repeat until not (exists sheet 1)
			end repeat
			display dialog "Select desired dictation languages (see: Languages > Edit…)" buttons {"Exit Setup", "Continue Setup"} cancel button "Exit Setup" default button "Continue Setup"
			
			-- should open "Text Input" > "Edit…" dialog
			activate
			repeat until exists button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
			end repeat
			click button 1 of group 3 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
			repeat until exists sheet 1
			end repeat
			
			tell sheet 1
				tell group 2 of scroll area 1 of group 2 of splitter group 1 of group 1
					my set_checkbox(checkbox "Correct spelling automatically", 0)
					my set_checkbox(checkbox "Capitalize words automatically", 0)
					my set_checkbox(checkbox "Show inline predictive text", 0)
					my set_checkbox(checkbox "Add period with double-space", 0)
				end tell
			end tell
			display dialog "Set desired input methods." buttons {"Exit Setup", "Continue Setup"} cancel button "Exit Setup" default button "Continue Setup"
			-- close
			click button 1 of group 2 of splitter group 1 of group 1 of sheet 1
			-- wait for slow sheet animation
			repeat until not (exists sheet 1)
			end repeat
			-- close settings window
			click button 1
		end tell
	end tell
end tell

return

(*
 * set_checkbox(Object check_box, int desired)
 * 
 * toggle checkbox if value doesn't match what desired
 *)
on set_checkbox(check_box, desired)
	tell application "System Events"
		tell check_box
			if (value is not desired) then
				click
			end if
		end tell
	end tell
end set_checkbox
