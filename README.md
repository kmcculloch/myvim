# myvim

May 2016 rewrite of my vim configurations.

Basic architecture inspired by https://github.com/fsproru/vimfiles.

Installation:

```
git clone https://github.com/kmcculloch/myvim
cd myvim
git submodule update --init
cd $HOME
ln -s /path/to/myvim/ .vim
ln -s /path/to/myvim/vimrc .vimrc
vi
:PluginInstall
```
