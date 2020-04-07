#!/bin/sh

path=$(cd `dirname $0`; pwd)

sudo apt-get install -y zsh git wget

# 从git上把oh-my-zsh clone下来到根目录下
git clone https://gitee.com/jiejieTop/ohmyzsh.git ~/.oh-my-zsh
# 再在根目录下copy一份.zshrc配置
# cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# wget https://raw.githubusercontent.com/jiejieTop/linux-script-tools/master/install/.zshrc ~/.zshrc

cp $path/.zshrc ~/.zshrc

source ~/.zshrc

# 设置zsh是默认shell
# chsh -s /bin/zsh

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

source ~/.zshrc
