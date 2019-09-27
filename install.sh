pushd ~
# Create symlinks
ln -s .dotfiles/zsh/.zshrc
ln -s .dotfiles/vim/.vimrc
ln -s .dotfiles/tmux/.tmux.conf
ln -s .dotfiles/.tmux.conf.local
mkdir -p .config
ln -s ~/.dotfiles/vim .config/nvim
popd

git submodule init
git submodule update

#Install VIM plugins
vim -u vim/bundles.vim +PluginInstall +qall

# set git config
git config --global core.excludesfile ~/.dotfiles/git/.gitignore_global

