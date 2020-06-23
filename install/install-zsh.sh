#!/bin/bash

sudo apt-get -y install git wget zsh

chsh -s /bin/zsh

if [ ! -d ~/.oh-my-zsh -o ! -f ~/.zshrc ]; then
    sh -c "$(wget https://gitee.com/jiejieTop/ohmyzsh/raw/master/tools/install.sh -O -)"
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open

sed -i 's/plugins=(git)/plugins=(z git sudo extract vi-mode git-open safe-paste command-not-found colored-man-pages zsh-syntax-highlighting)/g' ~/.zshrc

# source ~/.zshrc
