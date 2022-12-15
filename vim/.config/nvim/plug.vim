"""" VIM PLUG CONFIG 

" VimPlug
call plug#begin('~/.vim/plugged')
    " COC base
    " All COC extensions CocInstall <extension>
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-telescope/telescope.nvim'
    " sudo apt-get install ripgrep
    " sudo apt install fd-find

    " Themes
    " Plug 'ayu-theme/ayu-vim'
   " Plug 'fatih/molokai'
   " Plug 'tanvirtin/monokai.nvim'
   Plug 'sainnhe/sonokai'

    " Comment any code!
    " Plug 'tpope/vim-commentary'

    " airlines
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " Plug 'nathanaelkane/vim-indent-guides'

    " git flow
    " Plug 'tpope/vim-fugitive'
    " Plug 'junegunn/gv.vim'   
    " Plug 'airblade/vim-gitgutter'

    " LSP 
    " Plug 'fannheyward/coc-pyright'
    Plug 'neoclide/coc-python'

    " Work with tests
    Plug 'vim-test/vim-test'

    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
    " Plug 'ryanoasis/vim-devicons' Icons without colours
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

    " Workspaces
    Plug 'andreyorst/SimpleWorkspaces.vim'

    " Git
    Plug 'APZelos/blamer.nvim'
    Plug 'kdheepak/lazygit.nvim'

    Plug 'ryanoasis/vim-devicons'

    Plug 'tpope/vim-projectionist'

    Plug 'tpope/vim-dispatch'

    Plug 'nvim-lua/plenary.nvim'

    Plug 'mg979/vim-visual-multi', {'branch': 'master'}

    Plug 'numToStr/Comment.nvim'

    Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

    Plug 'gennaro-tedesco/nvim-peekup'

    Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', {'branch': 'main'}
    Plug 'jparise/vim-graphql'
    Plug 'acro5piano/vim-jsx-replace-tag'

    Plug 'windwp/nvim-autopairs'
    Plug 'lambdalisue/suda.vim'

    Plug 'machakann/vim-highlightedyank'
    Plug 'svban/YankAssassin.vim', {'branch': 'main'}

    Plug 'moll/vim-bbye'

    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'tpope/vim-unimpaired'
    Plug 'ThePrimeagen/harpoon'
call plug#end()

