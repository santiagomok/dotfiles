# Sets reasonable macOS defaults.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Show the ~/Library folder.
chflags nohidden ~/Library

# Always show scrollbars
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Run the screensaver if we're in the bottom-left hot corner.
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0

# Set Directory Service Login Window Binding timeout (seconds)
#defaults write /Library/Preferences/com.apple.loginwindow DSBindTimeout -int 20
# Turn OD debug mode - log at /var/log/opendirectoryd
#odutil set log <debug|default>

# Set Font smoothing value for non-retina
# 0:off 1:light 2:medium 3:strong
# defaults -currentHost write -g AppleFontSmoothing -int 0 
