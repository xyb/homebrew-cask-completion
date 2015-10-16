# Homebrew Cask Completion

Bash and fish auto-completion scripts for [brew-cask](https://github.com/caskroom/homebrew-cask/). Does not work for `brew cask` currently.

If you looking for zsh support, please use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

## Installation

Just type:

    brew install homebrew/completions/brew-cask-completion

Or:

    brew tap homebrew/completions
    brew install brew-cask-completion

## Manual Installation

Bash:

    git clone https://github.com/xyb/homebrew-cask-completion.git
    cd homebrew-cask-completion/
    ln -s $(pwd)/homebrew-cask-completion.bash $(brew --prefix)/etc/bash_completion.d/brew-cask

Fish:

    git clone https://github.com/xyb/homebrew-cask-completion.git
    cd homebrew-cask-completion/
    mkdir -p ~/.config/fish/completions
    ln -s $(pwd)/brew-cask.fish ~/.config/fish/completions
