#!/usr/bin/env bash 

# for debian based only
sudo apt install zsh sway git wofi zsh stow mako-notifier waybar foot

mv ../dotfiles ~/ 

toStow=("wallpapers" "mako" "waybar" "foot" "localBins" "sway" "wofi" "zsh") 

for i in "${toStow[@]}"; do 
  stow "$i"
done

file=~/.config/user-dirs.dirs
if [ -f "$file" ]; then
  stow dirs   
fi

echo -e "--- GIT CONFIG ---\n\n"

echo "enter email: "
read email 

echo "enter name: "
read name

echo "[user]
	name = $name
	email = $email
[init]
	defaultBranch = main
[color]
	ui = auto
[pull]
	rebase = false" > ~/.gitconfig

echo -e "--- ZSH Setup ---\n\n"

# change shell to zsh
echo "Changing shell to zsh: "
if [ "$EUID" -ne 0 ]; then
  chsh -s $(which zsh)
fi
