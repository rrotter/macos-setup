macos-setup
===========

Scripts to configure a new install of macOS, in the particular way I want. Intentionally extremely opinionated.

Features
--------
- Set many settings that seem to only work in the GUI (boo!)
- Set many other settings where Apple actually respects their own `defaults write` tool (yay!)
- Uses ansible, deletes it afterword
- Installs homebrew
- Installs dotfiles
- Installs global brewfile

Usage
-----
Get this repo _the hard way_. Because Xcode and homebrew aren't installed yet we don't have `git` or `wget`.
```
cd /tmp
curl -OL https://github.com/rrotter/macos-setup/archive/refs/heads/main.zip
unzip main.zip
cd macos-setup-main
```
Run every script in the top level in order
```
./00<tab>
...
```

Credits and references
----------------------
- inspired/cribbed from [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
- docs on getting scripting prefpanes to open from [bvanpeski](https://github.com/bvanpeski)
  - [How to open every section of macOS Ventura System Settings](https://www.macosadventures.com/2022/12/05/how-to-open-every-section-of-macos-ventura-system-settings/)
  - [bvanpeski/SystemPreferences](https://github.com/bvanpeski/SystemPreferences)
