# My Vim Configuration

Please refer to my [.vimrc](https://github.com/nichohells/myVim/blob/main/.vimrc), which is explained in detail

# Installation

0. Install the necessary dependencies for Vim

sudo apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git build-essential cscope

1. Clone the official [Vim](https://github.com/vim/vim) repository using

git clone https://github.com/vim/vim.git

2. Navigate into the Vim directory:

cd vim

3. Configure Vim with the desired features,
   example below is the easiest way to compile Vim with system clipboard support (highly requested):

./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope --with-x --prefix=/usr/local

4. Compile and install Vim:

make

sudo make install

# Remember

You don't need to use Neovim at all, Vim is way more than enough.

Bram Moolenaar, who joined the stars above on 08/03/2023, has left behind a legacy that reminds us the free software movement is about more than just code. It’s also about community, generosity, and humanity.

While Vim is free software, you are encouraged to support the orphans of Uganda through donations. For more information, please visit:

• https://www.vim.org/

• https://iccf-holland.org/ ICCF Holland - helping children in Uganda - founded by Bram Moolenaar
