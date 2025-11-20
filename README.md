## Dependencies

First, the programs configured

```
$ sudo pacman -S dunst foot hyprland rofi waybar zsh
```

Then, the other needed programs
```
$ sudo pacman -S git stow
```

## Installation

First, check out the repo in your $HOME directory with git

```
$ git clone git@github.com/qweenkie/dotfiles.git
$ cd dotfiles
```

Then, use GNU Stow to generate symlinks

```
$ stow .
```
