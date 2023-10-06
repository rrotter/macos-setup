#!/bin/sh

dockutil --remove "App Store"
sleep 1
dockutil --remove "Contacts"
sleep 1
dockutil --remove "FaceTime"
sleep 1
dockutil --remove "Keynote"
sleep 1
dockutil --remove "Launchpad"
sleep 1
dockutil --remove "Maps"
sleep 1
dockutil --remove "Music"
sleep 1
dockutil --remove "Numbers"
sleep 1
dockutil --remove "Pages"
sleep 1
dockutil --remove "Photos"
sleep 1
dockutil --remove "Reminders"
sleep 1
dockutil --remove "System Settings"
sleep 1
dockutil --remove "TV"

osascript -e 'tell app "Finder" to quit'

# show file extensions, and don't whine when I change them
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# don't use Tabs in Finder
defaults write com.apple.finder FinderSpawnTab -bool false

# show drives on Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# New Finder windows show home dir
defaults write com.apple.finder NewWindowTarget PfHm
defaults write com.apple.finder NewWindowTargetPath "file://${HOME}/"

# Finder search scope: Current Folder
defaults write com.apple.finder FXDefaultSearchScope SCcf

open -a Finder
