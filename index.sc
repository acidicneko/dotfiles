start common

print Installing Alacritty config
alacritty/alacritty.yml=$HOME/.config/alacritty/alacritty.yml
endl

print Installing Iosevka Nerd Font
fonts/IosevkaNerdFont.ttf=$HOME/.local/share/fonts/IosevkaNerdFont.ttf
exec fc-cache -fv
endl

print Installing Picom config
picom/picom.conf=$HOME/.config/picom/picom.conf
endl

print Installing aliases
.aliases=$HOME/.aliases
endl

print Installing zshrc
.zshrc=$HOME/.zshrc
endl

stop common


start bspwm

print Installing bspwm config
bspwm/bspwmrc=$HOME/.config/bspwm/bspwmrc
endl

print Installing sxhkd config
sxhkd/sxhkdrc=$HOME/.config/sxhkd/sxhkdrc
endl

stop bspwm


start i3

print Installing i3 config
i3/config=$HOME/.config/i3/config
endl

print Installing i3status config
i3status/config=$HOME/.config/i3status/config
endl

stop i3


