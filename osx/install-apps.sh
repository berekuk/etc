#!/bin/sh
set -e

brew install caskroom/cask/brew-cask

for cask in 1password adium alfred anki balsamiq-mockups dash dropbox evernote firefox flux iterm2 sketch skype transmission vlc ynab karabiner seil slate; do
    brew cask install $cask
done

brew install \
    emacs vim \
    git mercurial subversion \
    docker docker-compose docker-machine \
    gcc ghc cabal-install go rust \
    node pypy python python3 \
    rbenv \
    ansible bash-completion jq sqlite tmux wget
