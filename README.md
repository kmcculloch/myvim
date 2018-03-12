# myvim

May 2016 rewrite of my vim configurations.

Basic architecture inspired by https://github.com/fsproru/vimfiles.

Installation:

```
git clone https://github.com/kmcculloch/myvim
cd myvim/vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
cd $HOME
ln -s /path/to/myvim/ .vim
ln -s /path/to/myvim/vimrc .vimrc
vi
:PluginInstall
```

Recommended lint packages:

```
composer install global phpcs
npm install -g eslint
npm install -g csslint
npm install -g sass-lint
```
