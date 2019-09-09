pushd ~
# Create symlinks
ln -s .dotfiles/zsh/.zshrc
ln -s .dotfiles/vim/.vimrc
popd

git submodule init
git submodule update

vim -u vim/bundles.vim +PluginInstall +qall #Install bundles

