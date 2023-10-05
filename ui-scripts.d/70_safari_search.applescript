#!/usr/bin/osascript
(* Safari search settings
 * 
 * Use Duck Duck Go
 * 
 *)

global app_name
set app_name to "Safari"

tell application app_name to activate

tell application "System Events"
	tell process app_name
		click menu item "Settings…" of menu "Safari" of menu bar 1
		-- Use DuckDuckGo
		click button "Search" of toolbar 1 of window 1
		tell window "Search"
			my set_pop_up(pop up button "Search engine:" of group 1 of group 1, "DuckDuckGo")
			display dialog "Safari Search Settings complete!" buttons {"Exit Setup", "Continue Setup"} cancel button "Exit Setup" default button "Continue Setup"
			-- close settings window
			click button 1
		end tell
	end tell
end tell

return

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
