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
If you are facing any errors, you might already have config's for these in your `.config` folder. Then you have to delete those, and rerun the command again.

I've custom `user-dirs.dirs` config since I want my folders such as `Downloads`, `Documents` all lowercase, like `downloads` etc.

If you aren't doing a base install, you might already have `user-dirs.dirs` in your config. And you might have already used the existing folders defined inside it, so it's best not to meddle in it.

If you don't have `user-dirs.dirs` and want all the user-dirs to have lowercase name.
```bash
stow dirs
```

If you are using a single monitor(or laptop), run this command.
```bash
sed -i '/^output DVI-D-1 transform 270 pos 0,0$/d' ~/.config/sway/config
sed -i '/^output HDMI-A-1 pos 1080,400$/d' ~/.config/sway/config
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

6. Additional system tray applet's and other programs to utilise the configs to the max.
```bash
sudo apt install qalc pipx mpv-mpris playerctl tmux kdeconnect kdeconnect-indicator nm-applet swayidle swaylock udiskie blueman-applet mpv bat imv zathura neovim neofetch
```
```bash
pipx autotiling # for the dynamic tiling
```

I have automatic music playback set up in my pc startup, for that, link my hdd to my home directory 
```bash
ln -s ~/media/<path-to-hdd> ~/hdd
```
I use 

`JetBrainsMono Nerd Font` for my mono space, and I use `Fira Sans` as the interface font.

[Nord](https://addons.mozilla.org/en-US/firefox/addon/nord-firefox/) theme in Firefox.

Materia Kde and GTK theme for my applications and Papirus as the icon theme. For cursors, the default Adwaita theme.
```bash
sudo apt install materia-kde materia-gtk-theme papirus-icon-theme qt5ct 
```
Use `qt5ct` and `kvantum manager` to set the `qt` theme. If it doesn't work, make sure to put the following command in the `.zshenv`. (It's already set up in my config)
```bash
export QT_QPA_PLATFORMTHEME=qt5ct
```

Set `gtk` theme with [nwg-look](https://github.com/nwg-piotr/nwg-look)

For Fonts
```
sudo apt install fonts-noto fonts-noto-color-emoji fonts-font-awesome 
```

I'm using Neovim [NvChad](https://github.com/NvChad/NvChad) config here, although I'm satisfied with this setup, I'm currently trying to do a NeoVim config of my own, and I'm also trying to learn Emacs in the side.

#### Note: I've made this repo to upload my configs and to easily reproduce my setup in my other systems. I'm not a pro, and some of these commands can cause errors in your system. So, please handle with care! Read the commands before executing them.

#### Note: Many of the config's and shell scripts are copied from other Git repo's and I modified it to my taste, I'll add the credits soon. 
