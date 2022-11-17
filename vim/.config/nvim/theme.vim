"""" THEME SETTINGS

" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

""" THEME AYU Theme
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
" let g:molokai_original = 1
" colorscheme molokai
" hi CursorLine                    guibg=#f06932
" hi CursorLineNr    guifg=#f06932               gui=none
" hi Pmenu           guifg=#66D9EF guibg=#f06932
" hi PmenuSel                      guibg=#f06932
" hi PmenuSbar                     guibg=#f06932
" hi PmenuThumb      guifg=#66D9EF
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
colorscheme sonokai
