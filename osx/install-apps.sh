#!/bin/sh
set -e

brew install caskroom/cask/brew-cask

for cask in adium alfred anki balsamiq-mockups dash dropbox evernote firefox flux iterm2 sketch skype transmission vlc ynab; do
    brew cask install $cask
done
