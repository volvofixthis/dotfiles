"""" VIM PLUG CONFIG 

" VimPlug
call plug#begin('~/.vim/plugged')
    " COC base
    " All COC extensions CocInstall <extension>
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-telescope/telescope.nvim'
    " sudo apt-get install ripgrep
    " sudo apt install fd-find

    " Themes
    Plug 'ayu-theme/ayu-vim'
    " Comment any code!
    " Plug 'tpope/vim-commentary'

    " airlines
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'nathanaelkane/vim-indent-guides'

    " git flow
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'   
    " Plug 'airblade/vim-gitgutter'

    " LSP 
    " Plug 'fannheyward/coc-pyright'
    Plug 'neoclide/coc-python'

    " Better syntax support
    Plug 'sheerun/vim-polyglot'

    " Debuger
    Plug 'puremourning/vimspector'
    " :VimspectorInstall debugpy
    " For use with python3 run 
    " python -m pip install --user --upgrade pynvim
    " pip3 install pynvim
    " pip3 install jedi
    "
    " Work with tests
    Plug 'vim-test/vim-test'

    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    " Plug 'ryanoasis/vim-devicons' Icons without colours
    Plug 'akinsho/bufferline.nvim'

    " Plug 'kyazdani42/nvim-tree.lua'
    " Plug 'preservim/nerdtree'

    " Workspaces
    Plug 'andreyorst/SimpleWorkspaces.vim'

    Plug 'APZelos/blamer.nvim'
    Plug 'kdheepak/lazygit.nvim'

    Plug 'voldikss/vim-floaterm'

    Plug 'ryanoasis/vim-devicons'

    Plug 'tpope/vim-projectionist'

    Plug 'tpope/vim-dispatch'

    Plug 'nvim-lua/plenary.nvim'

    Plug 'NTBBloodbath/rest.nvim', {'branch': 'main'}

    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    Plug 'numToStr/Comment.nvim'  
    
call plug#end()


