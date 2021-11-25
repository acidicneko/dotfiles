#!/bin/env bash

DOTDIR="$HOME"/.cache/dot_installer

get_sources () {
    git clone https://github.com/clawbhaiya/dotfiles.git "$DOTDIR"

    wget https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf -O "$DOTDIR"/Iosevka\ Nerd\ Font\ Complete.ttf
    
    wget https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MzY2NjI0MDIiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjBlYjE4MmI5ZTA4YTU5ODc1NzhiMTkyOTBhYThlMmJlYzIzOTA2OTcyZTZiNzZkZjI4MjJmZWI3MDQ2Nzc0YjM2MDdlY2Y4NTk0NGQ0NjYxOTFmNmZmMjc5MjZjYTA3NTVmNzNjN2FkMGQ0YTQ5OTRhOTM2N2NkNmVkZGI2ODY4IiwidCI6MTYzNjk1OTU1MCwic3RmcCI6IjQwYWJlYjI2YTBlOGRhY2M1ZGRiOGU1YTY0NzdmN2UxIiwic3RpcCI6IjE3MS43Ni4yNDYuNTUifQ.-52i28RnP7OBgBvgHOgyqDQlhf_FMVruPlvK01aHhK0/Nordic-bluish-accent-v40.tar.xz -O "$DOTDIR"/Nordic-bluish-accent-v40.tar.xz

    wget https://dl2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MzU4MDQ2OTYiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImQ5YzFiYzM4YzhhN2NmOTU2YmUxNDUyZmE5MGFlYTc4NTEyMDRiYjg5Y2Y4NGE5ZmEyYmRmMGQ3YmZjMGNjYzZkMWM3YTlmN2JlOWE1NzAwZDE4MDFmMDBhODJlNGUxY2U4NDYxM2Y1Y2E1NzU0ZmMwN2E3ZmI4MmNkZGVmMzUyIiwidCI6MTYzNjk1OTg1Miwic3RmcCI6IjQwYWJlYjI2YTBlOGRhY2M1ZGRiOGU1YTY0NzdmN2UxIiwic3RpcCI6IjE3MS43Ni4yNDYuNTUifQ.B-8j7Bt_IaJqqUxk-wu2R7S2SzI1Iik9ba7l53Tl0Lk/papirus-icon-theme-nordic-folders.tar.xz -O "$DOTDIR"/papirus-icon-theme-nordic-folders.tar.xz

    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh

    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O "$DOTDIR"/poshthemes/themes.zip
}

install_dots () {
    mkdir -p ~/.config/bspwm
    mv "$DOTDIR"/dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
    
    mkdir -p ~/.config/alacritty
    mv "$DOTDIR"/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

    mkdir -p ~/.config/picom
    mv "$DOTDIR"/dotfiles/picom/picom.conf ~/.config/picom/picom.conf

    mkdir -p ~/.config/sxhkd
    mv "$DOTDIR"/dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
    
    mkdir -p ~/.config/polybar
    mv "$DOTDIR"/polybar ~/.config/polybar 
    
    mv "$DOTDIR"/dotfiles/.zshrc ~/.zshrc

    unzip "$DOTDIR"/poshthemes/themes.zip -d ~/.config/poshthemes
    chmod u+rw ~/.config/poshthemes/*.json

    sudo make install -C "$DOTDIR"/dotfiles/dmenu

    tar -xf "$DOTDIR"/Nordic-bluish-accent-v40.tar.xz -C "$DOTDIR"
    sudo mv "$DOTDIR"/Nordic-bluish-accent-v40 /usr/share/themes/

    sudo tar -xf "$DOTDIR"/papirus-icon-theme-nordic-folders.tar.xz -C /usr/share/icons/

    sudo mv "$DOTDIR"/Iosevka\ Nerd\ Font\ Complete.ttf /usr/share/fonts/Iosevka\ Nerd\ Font\ Complete.ttf
    fc-cache -fv

    sudo mkdir /usr/share/backgrounds
    sudo mv "$DOTDIR"/dotfiles/cool_nord.jpg /usr/share/backgrounds

    sudo chmod +x /usr/local/bin/oh-my-posh

    bash -c "$(curl https://raw.githubusercontent.com/clawbhaiya/nyaavim/main/tools/install.sh)"
}

install_packages () {
    pacman -S bspwm sxhkd alacritty polybar neovim nitrogen wget lxappearance lxsession zsh zsh-syntax-highlighting zsh-autosuggestions --needed --noconfirm
    paru -S picom-ibhagwan-git
}

install_paru () {
    git clone https://aur.archlinux.org/paru-bin.git "$DOTDIR"/paru/
    cd "$DOTDIR"/paru/
    makepkg -sir
}

main () {
    echo Installing missing dependencies...
    install_packages
    
    mkdir "$DOTDIR"

    if [ ! -f /usr/bin/paru ] ; then
        install_paru
    fi

    echo Downloading sources....
    get_sources

    echo Installing dots...
    install_dots

    echo Cleaning up...
    rm -rf "$DOTDIR"

    echo Done! Please login into bspwm.
}

main
