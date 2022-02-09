"""File created by motive https://www.chrisatmachine.com/neovim
set mouse=a  " enable mouse
" set t_Co=256
set langmenu=en_US.UTF-8
language en_US.UTF-8
set encoding=utf-8
set number
set noswapfile
set scrolloff=7
set cursorline
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
filetype on
filetype indent on      " load filetype-specific indent files
" set relativenumber
set signcolumn=number
" For right work install xclip (:help clipboard)
set clipboard=unnamedplus " shared clipboard with system
set guicursor=i:block

" Tabs
" set showtabline=2

""" :CocInstall coc-json coc-pyright coc-go coc-flutter coc-terminal coc-lua
""" npm install -g luafmt
""" Use font-patcher.py for install fonts 
"""" ```python font-patcher.py "Fura Mono Regular Nerd Font Complete Windows Compatible.otf"``` 

augroup JsonToJsonc
    autocmd! FileType json set filetype=jsonc
augroup END

set signcolumn=yes:2
set wildmode=longest:full,full
set smartcase 
set ignorecase
set list
set nojoinspaces
set splitright
" Confirmation on unsaved buffer
set confirm
" Отображает пробелы
" set listchars=trail:·
set hidden
" Transparency
set pumblend=30
set winblend=30
set viewoptions-=options

