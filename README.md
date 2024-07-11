# My Vim Configuration
Please refer to my [.vimrc](https://github.com/nichohells/myVim/blob/main/.vimrc), which is explained in detail

# Installation
Always compile Vim using the following config, this will ensure there is 
support for access into the system's clipboard and avoid annoyances.

git clone https://github.com/vim/vim.git

or #recommended

git clone git@github.com:vim/vim

cd vim

./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --with-x \
    --prefix=/usr/local

make

sudo make install

# Remember
You don't need to use Neovim at all, Vim is way more than enough.
