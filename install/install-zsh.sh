#!/bin/bash
###
 # @Author: jiejie
 # @GitHub: https://github.com/jiejieTop
 # @Date: 2021-02-25 15:04:20
 # @LastEditors: jiejie
 # @LastEditTime: 2021-02-27 13:49:35
 # @Description: the code belongs to jiejie, please keep the author information and source code according to the license.
### 

sudo apt-get -y install git wget zsh

chsh -s /bin/zsh

if [ ! -d ~/.oh-my-zsh -o ! -f ~/.zshrc ]; then
    sh -c "$(wget https://gitee.com/jiejieTop/ohmyzsh/raw/master/tools/install.sh -O -)"
fi

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/paulirish/git-open.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/git-open

git clone https://github.com/arzzen/calc.plugin.zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/calc/calc.plugin.zsh

sed -i 's/plugins=(git)/plugins=(z git sudo extract vi-mode git-open safe-paste command-not-found colored-man-pages zsh-syntax-highlighting vscode zsh-autosuggestions)/g' ~/.zshrc

source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/calc/calc.plugin.zsh/calc.plugin.zsh


# source ~/.zshrc
