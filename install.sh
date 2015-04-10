#!/usr/bin/bash

defaults write com.apple.finder AppleShowAllFiles YES; # show hidden files
defaults write com.apple.dock persistent-apps -array; # remove icons in Dock
defaults write com.apple.dock tilesize -int 36; # smaller icon sizes in Dock
defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay
defaults write com.apple.dock autohide-time-modifier -float 0; # remove Dock show delay
defaults write com.apple.dock orientation right; # place Dock on the right side of screen
defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # show all file extensions
killall Dock;
killall Finder;
  
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew install \
  boost	\
  caskroom/cask/brew-cask \
  cmake	\
  git \
  leiningen \
  mongodb \
  mysql \
  nmap \
  node \
  openssl \
  privoxy \
  pssh \
  python \
  redis \
  homebrew/versions/swig304 \
  tor \
;
brew tap caskroom/versions;
brew cask install \
  1password \
  adium \
  clion-rc-bundled \
  dropbox \
  firefox \
  flash \
  google-chrome \
  google-chrome-canary \
  java \
  keka \
  kindle \
  mactracker \
  microsoft-office \
  sequel-pro \
  skype \
  silverlight \
  spectacle \
  spotify \
  sublime-text \
  vagrant \
  virtualbox \
  vlc \
  vmware-fusion \
  webstorm \
;

git config --global credential.helper osxkeychain; # activate git credentials storage
git config --global push.default simple; # default Git push behavior is set to `simple`

echo "Setting up MongoDB...";
sudo mkdir -p /data/db;
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents;
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist;
