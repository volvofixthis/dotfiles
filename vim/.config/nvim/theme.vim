"""" THEME SETTINGS

if exists('+termguicolors')
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  set t_Co=256
endif

" enable syntax
syntax enable

" Colorscheme
let g:sonokai_better_performance = 1
colorscheme sonokai
