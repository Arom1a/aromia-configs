# aromia-configs

This repository is for storing my configs and scripts.

<!-- ## Features
Themes: 
Catppuccin: mocha as default
nvim: lunar

For zsh:

For alacritty:

For git: -->

## Installation

Requirement:
You must have [GNU Stow](https://www.gnu.org/software/stow/) installed.
Install using

```zsh
# Arch
sudo pacman -S stow

# Homebrew
brew install stow
```

Then

```zsh
cd ~ &&
git clone https://github.com//arom1a/aromia-configs Configs &&
cd Configs &&
stow -v .
```

If you want to use keyd:

```zsh
sudo mkdir /etc/keyd &&
cd .config &&
sudo stow -vt /etc/keyd keyd
```
