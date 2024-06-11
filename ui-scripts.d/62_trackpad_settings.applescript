#!/usr/bin/osascript
(* Trackpad
 *
 * Disable silent clickingn
 *
 *)

global app_name
set app_name to "System Settings"

do shell script "open x-apple.systempreferences:com.apple.preference.trackpad"

tell application "System Events"
	tell process app_name
		-- wait for prefpane to load
    repeat until exists checkbox "Silent clicking" of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window 1
		end repeat
		
		tell window 1
			tell group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1
        my set_checkbox(checkbox "Silent clicking", 0)
			end tell
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
