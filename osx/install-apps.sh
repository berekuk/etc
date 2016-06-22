#!/bin/sh
set -e

brew install caskroom/cask/brew-cask

for cask in 1password adium alfred anki balsamiq-mockups brain-workshop dash dropbox evernote firefox flux iterm2 sketch skype transmission vlc ynab karabiner seil slate; do
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

brew tap d12frosted/emacs-plus
brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon
mv $(ls -1 /usr/local/Cellar/emacs/ | tail -1)/Emacs.app /Applications/
