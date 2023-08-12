# dotfiles
## My personal dotfiles managed using GNU Stow

Currently I use Sway window manager with two monitors (one horizontal + one vertical), here's a quick look.

![Current Sway Window Manager Setup](./20230709_18:37:45_247915744.png)

To replicate my setup, follow the given steps: 

1. Install the packages
```bash
sudo apt install zsh sway git wofi zsh stow mako-notifier waybar foot
```
Use the package manager of your system, most of the package's names are same in all distros.

2. Clone the Repo
```bash
git clone --recursive https://github.com/shonebinu/dotfiles.git ~/dotfiles
```
For Stow to work per my setup, you have to put the dotfiles in the home directory.

3. CD into the repo's root directory, then run `stow <foldername>` to restore the appropriate configuration of the same program. Please replace `<foldername>` with the actual name of the folder you want to use with the stow command.

If you want to copy all my configs.
```bash
cd ~/dotfiles
toStow=("wallpapers" "mako" "waybar" "foot" "localBins" "sway" "wofi" "zsh") 
for i in "${toStow[@]}"; do 
  stow "$i"
done
```
I've custom `user-dirs.dirs` config since I want my folders such as `Downloads`, `Documents` all lowercase, like `downloads` etc.

If you aren't doing a base install, you might already have `user-dirs.dirs` in your config. And you might have already used the existing folders defined inside it, so it's best not to meddle in it.

If you don't have `user-dirs.dirs` and want all the user-dirs to have lowercase name.
```bash
stow dirs
```

4. Change the shell to `zsh`
```bash
chsh -s $(which zsh) # don't use sudo here
```
If you find any error related to `zsh` when exiting the terminal, run this command
```bash
mkdir -p ~/home/$USER/.cache/zsh
```

5. Just for the sake of completeness, If you want to copy my Git config. 
```bash
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
```




I'm using Neovim [NvChad](https://github.com/NvChad/NvChad) config here, although I'm satisfied with this setup, I'm currently trying to do a NeoVim config of my own, and I'm also trying to learn Emacs in the side.