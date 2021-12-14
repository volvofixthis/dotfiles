"""" INIT CONFIG FOR NVIM

source $HOME/.config/nvim/base.vim
source $HOME/.config/nvim/filemanager.vim
source $HOME/.config/nvim/plug.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/vimtest.vim
source $HOME/.config/nvim/keybinding.vim
source $HOME/.config/nvim/indent.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/lua_autoformat.vim
source $HOME/.config/nvim/coc-explorer.vim
" source $HOME/.config/nvim/simpleworkspaces.vim
" source $HOME/.config/nvim/neerdtree.vim
lua << EOF
require"nvim-web-devicons".setup{}
require"bufferline".setup{}
EOF
source $HOME/.config/nvim/treesitter.vim
source $HOME/.config/nvim/rest.vim

