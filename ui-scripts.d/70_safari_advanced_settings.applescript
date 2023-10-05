#!/usr/bin/osascript
(* Safari advanced settings
 * 
 * turn on safari dev tools and tracker blocking
 *)

global initial_apps
global app_name
set app_name to "Safari"

tell application "System Events"
	set initial_apps to (name of processes)
end tell

tell application app_name to activate

tell application "System Events"
	tell process app_name
		click menu item "Settings…" of menu "Safari" of menu bar 1
		click button "Advanced" of toolbar 1 of window 1
		tell window "Advanced"
			-- Enable Develop Menu
			if exists checkbox "Show features for web developers" of group 1 of group 1 then -- Sonoma
				set my_checkbox to checkbox "Show features for web developers" of group 1 of group 1
			end if
			if exists checkbox "Show Develop menu in menu bar" of group 1 of group 1 then -- Ventura
				set my_checkbox to checkbox "Show Develop menu in menu bar" of group 1 of group 1
			end if
			tell my_checkbox
				if not value as boolean then
					click
				end if
			end tell
			
			if exists checkbox "Use advanced tracking and fingerprinting protection" of group 1 of group 1 then
				set my_checkbox to checkbox "Use advanced tracking and fingerprinting protection" of group 1 of group 1
				-- turn on advanced tracking protection
				tell my_checkbox
					if not value as boolean then
						click
					end if
				end tell
				-- ... in all browsing
				my set_pop_up(pop up button 3 of group 1 of group 1, "in all browsing")
			end if
			display dialog "Safari Advanced Settings complete!" buttons {"Exit Setup", "Continue Setup"} cancel button "Exit Setup" default button "Continue Setup"
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
