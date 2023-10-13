#!/usr/bin/osascript
(* Control Center
 *
 * Disable unwanted menuextras
 * Menu Bar clock: enable 24h clock, display seconds
 *)

global app_name
set app_name to "System Settings"

do shell script "open x-apple.systempreferences:com.apple.ControlCenter-Settings.extension"

tell application "System Events"
	tell process app_name
		-- wait for Displays prefpane to load
		repeat until exists group 1 of window "Control Center"
		end repeat
		
		tell window "Control Center"
			-- foo
			tell group 5 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
				my set_pop_up(pop up button "Spotlight", "Don’t show in Menu Bar")
				my set_pop_up(pop up button "Siri", "Don’t show in Menu Bar")
				click button "Clock"
			end tell
			-- wait for sheet animation
			repeat until (exists sheet 1)
			end repeat
			tell sheet 1
				tell group 2 of scroll area 1 of group 1
					my set_checkbox(checkbox "Use a 24-hour clock", 1)
					my set_checkbox(checkbox "Display the time with seconds", 1)
				end tell
				click button 1 of group 1
			end tell
			-- wait for sheet animation
			repeat until not (exists sheet 1)
			end repeat
			
			display dialog "Control Center Settings complete!" buttons {"Exit Setup", "Continue Setup"} cancel button "Exit Setup" default button "Continue Setup"
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

(*
 * set_pop_up(Object pop_up, int desired)
 *
 * if value doesn't match what desired, click pop_up followed by the desired menu item
 *)
on set_pop_up(pop_up, desired)
	tell application "System Events"
		tell pop_up
			if (value is not desired) then
				click
				tell menu item desired of menu 1
					click
				end tell
			end if
		end tell
	end tell
end set_pop_up
