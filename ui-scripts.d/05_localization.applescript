#!/usr/bin/osascript
(* Localization settings
 *
 * This needs to be done before Keyboard/Dictation settings.
 *
 * Setting to non-english will break all other scripts, could
 * run this (again?) later in the process or change the
 * localization strings in other scripts if that's needed
 *)

do shell script "open x-apple.systempreferences:com.apple.Localization-Settings.extension"

display dialog "Select desired languages. Decline restart. Decline password prompts (probably? I don't know what they do!)" buttons {"Exit Setup", "Continue Setup"} cancel button "Exit Setup" default button "Continue Setup"

tell application "System Settings" to quit
