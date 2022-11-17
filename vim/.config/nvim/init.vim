"""" INIT CONFIG FOR NVIM
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

source $HOME/.config/nvim/base.vim
source $HOME/.config/nvim/glow.vim
source $HOME/.config/nvim/blamer.vim
source $HOME/.config/nvim/plug.vim
lua require"plugins"
lua require"settings"
source $HOME/.config/nvim/filemanager.vim
source $HOME/.config/nvim/yankassassin.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/vimtest.vim
source $HOME/.config/nvim/keybinding.vim
source $HOME/.config/nvim/lua_autoformat.vim
source $HOME/.config/nvim/coc-explorer.vim
source $HOME/.config/nvim/go.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/dap.vim
" source $HOME/.config/nvim/neerdtree.vim
lua << EOF
require"nvim-web-devicons".setup{}
require"Comment".setup()
EOF
source $HOME/.config/nvim/bufferline.vim
source $HOME/.config/nvim/treesitter.vim
source $HOME/.config/nvim/autopairs.vim
source $HOME/.config/nvim/indent-blankline.vim
