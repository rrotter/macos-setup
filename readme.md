macos-setup
===========

Scripts to configure a new install of macOS, in the particular way I want. Intentionally extremely opinionated.

Features
--------
- Set many settings that seem to only work in the GUI (boo!)
- Set many other settings where Apple actually respects their own `defaults write` tool (yay!)
- Uses ansible, deletes it afterword
- Installs homebrew
- Doesn't (yet) do anything w/ dotfiles. It probably should.

Usage
-----
If you are me, run every script in the top level in order:
```
cd /tmp
git clone https://github.com/rrotter/macos-setup.git
cd macos-setup
./00<tab>
...
```

If you are anyone else, just poke around and crib what you find useful. You probably don't want to just run this as-is.

Credits and references
----------------------
- inspired/cribbed from [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)
- docs on getting scripting prefpanes to open from [bvanpeski](https://github.com/bvanpeski)
  - [How to open every section of macOS Ventura System Settings](https://www.macosadventures.com/2022/12/05/how-to-open-every-section-of-macos-ventura-system-settings/)
  - [bvanpeski/SystemPreferences](https://github.com/bvanpeski/SystemPreferences)
