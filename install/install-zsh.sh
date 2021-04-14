#!/bin/bash
###
 # @Author: jiejie
 # @GitHub: https://github.com/jiejieTop
 # @Date: 2021-02-25 15:04:20
 # @LastEditors: jiejie
 # @LastEditTime: 2021-04-14 16:35:38
 # @Description: the code belongs to jiejie, please keep the author information and source code according to the license.
### 

sudo apt-get -y install git wget zsh

chsh -s /bin/zsh

if [ ! -d ~/.oh-my-zsh -o ! -f ~/.zshrc ]; then
    # sh -c "$(wget https://gitee.com/jiejieTop/ohmyzsh/raw/master/tools/install.sh -O -)"
    git clone https://gitee.com/jiejieTop/ohmyzsh.git ~/.oh-my-zsh
    cp ~/.zshrc ~/.zshrc.orig
    source .zshrc
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh -s $(which zsh)
fi

git clone https://gitee.com/jiejieTop/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://gitee.com/jiejieTop/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://gitee.com/jiejieTop/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open

git clone https://gitee.com/jiejieTop/calc.plugin.zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/calc/calc.plugin.zsh

sed -i 's/plugins=(git)/plugins=(z git sudo extract vi-mode git-open safe-paste command-not-found colored-man-pages zsh-syntax-highlighting vscode zsh-autosuggestions)/g' ~/.zshrc

source .zshrc
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/calc/calc.plugin.zsh/calc.plugin.zsh


# source ~/.zshrc
