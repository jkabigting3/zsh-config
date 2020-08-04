#!/usr/bin/env zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
source $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install powerline font with icons
mkdir -p $HOME/.local/share/fonts
curl -fLo "$HOME/.local/share/fonts/Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fc-cache -f -v

sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

cd $(dirname "$0")
DOTDIR="$(pwd)/"

cd $HOME

for i in `\ls -ad1 $DOTDIR\.* | grep -v -e ".git"`; do
  j=$(basename $i)
  mv $j $j.old 2>/dev/null
  ln -s .dotfiles/$j . 2>/dev/null
done

ln -s $DOTDIR .dotfiles

chsh -s /usr/bin/zsh
