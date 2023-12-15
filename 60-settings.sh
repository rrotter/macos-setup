#!/bin/sh

### Dock ###

# waiting for a stable release of dockutil, until it drops you'll need to
# manually install with `brew install --HEAD dockutil`
# see:
#   - `brew info dockutil`
#   - `https://github.com/kcrawford/dockutil`

# not doing this automatically until there is stable release
# brew install dockutil

dockutil --no-restart --remove com.apple.AddressBook
dockutil --no-restart --remove com.apple.AppStore
dockutil --no-restart --remove com.apple.FaceTime
dockutil --no-restart --remove com.apple.Maps
dockutil --no-restart --remove com.apple.Music
dockutil --no-restart --remove com.apple.Photos
dockutil --no-restart --remove com.apple.TV
dockutil --no-restart --remove com.apple.iWork.Keynote
dockutil --no-restart --remove com.apple.iWork.Numbers
dockutil --no-restart --remove com.apple.iWork.Pages
dockutil --no-restart --remove com.apple.launchpad.launcher
dockutil --no-restart --remove com.apple.reminders
osascript -e 'tell app "Dock" to quit' # restart once, not after each removal

# brew uninstall dockutil # don't really need this once we're done

### Finder ###
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

### iCal ###
osascript -e 'tell app "Calendar" to quit'
defaults write com.apple.iCal "TimeZone support enabled" -bool true
