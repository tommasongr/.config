# Reset custom plugins
rm -R ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
mkdir ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

# Install custom plugins from git
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/aspirewit/zsh-nvm-auto-switch ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm-auto-switch
git clone https://github.com/b4b4r07/enhancd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/enhancd
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k

# Install custom local plugins
ln -shf ~/.config/zsh/plugins/web-search/ ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/local_plugins/web-search
