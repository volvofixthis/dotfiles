"""" THEME SETTINGS

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  set t_Co=256
endif

" enable syntax
syntax enable

" Colorscheme
" let g:molokai_original = 1
" colorscheme molokai
" hi CursorLine                    guibg=#f06932
" hi CursorLineNr    guifg=#f06932               gui=none
" hi Pmenu           guifg=#66D9EF guibg=#f06932
" hi PmenuSel                      guibg=#f06932
" hi PmenuSbar                     guibg=#f06932
" hi PmenuThumb      guifg=#66D9EF
" let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
colorscheme sonokai
