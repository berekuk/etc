#!/bin/sh

brew install caskroom/cask/brew-cask

for cask in adium alfred anki balsamiq-mockups dropbox evernote firefox flux iterm2 sketch skype transmission vlc ynab; do
    brew cask install $cask
done
