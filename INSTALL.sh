#!/usr/bin/env bash 

if [ "$EUID" -eq 0 ]; then
  echo "Please don't run it in sudo mode: it can cause issues when changing the shell."
  exit 1
fi

# for debian based only
sudo apt install zsh sway git wofi zsh stow mako-notifier waybar foot

mv ../dotfiles ~/ 

toStow=("wallpapers" "mako" "waybar" "foot" "localBins" "sway" "wofi" "zsh") 

for i in "${toStow[@]}"; do 
  stow "$i"
done

file=~/.config/user-dirs.dirs
if [ -f "$file" ]; then
  echo "My user dir's hasn't been copied over since your config has that file in it, and if i forcibly copy over, it can create a mess of directories."
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

mkdir -p ~/home/$USER/.cache/zsh
