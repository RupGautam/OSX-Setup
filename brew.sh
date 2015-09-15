#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install Python
brew install python
brew install python3

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Monitoring Tools
brew install dns2tcp
brew install netpbm
brew install nmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp 

#Utilites
brew install xpdf
brew install pngcheck


# Install other useful binaries.
brew install git
brew install git-lfs
brew install git-flow
brew install imagemagick --with-webp
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install pkg-config libffi

# Install Cask
brew install caskroom/cask/brew-cask

# Core casks
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Dev Tools
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" heroku-toolbelt

# My Daily Apps
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" Spotify #For Music
brew cask isntall --appdir="/Applications" vlc #Best mediaplayer
brew cask install --appdir="/Applications" unsplash-wallpaper #Wallpaper changer
brew cask install --appdir="/Applications" mac2imgur #Auto upload screenshots to IMGUR
brew cask install --appdir="/Applications" goofy #Desktop app for facebook messenger 
brew cask install --appdir="/Applications" ShiftIt #Resize windows, My (y) 

#Tap Popcorn Time manually - 
brew tap popcorn-time/homebrew-cask https://git.popcorntime.io/caskroom/homebrew-cask.git
brew cask install popcorn-time # Not sure if it is legal for you.

osascript -e 'tell application "System Events" to make new login item with properties { path: "/Applications/Dropbox.app" } at end'

brew cleanup





























