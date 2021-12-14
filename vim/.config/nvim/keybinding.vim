"""""" KEYBINDING CONFIG FOR NVIM"""""""""

" <silent> -- выделеное

"""LEADER KEY

"""FILE MANAGER"""
" nnoremap <leader>b  :Lexplore<CR>
" nnoremap <C-b> :NERDTreeToggle<CR>
function! s:open_explorer_reveal()
  let path = expand("%:p:h")
  echo "reveal in coc explorer".path
  exec ":call CocAction('runCommand', 'explorer.doAction', 'closest', ['quit'])"
  exec ":CocCommand explorer --no-toggle ".path
endfunction

nnoremap <silent> er :call <SID>open_explorer_reveal()<CR>

function! s:open_explorer_project()
  let path = getcwd()
  echo path
  exec ":CocCommand explorer ".path
endfunction

nnoremap <silent> <M-b> :call <SID>open_explorer_project()<CR>

""""""AUTOCOMPITE SETTINGS"""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

""" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
""""""END AUTOCOMPITE SETTINGS"""""""

" NeoVim terminal
nmap <leader>t :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" Commentary code
nnoremap <M-/> :Commentary<CR>
vnoremap <M-/> :Commentary<CR>

" Format code 
xmap <M-f>  <Plug>(coc-format-selected)
nmap <M-f>  <Plug>(coc-format-selected)
xmap <M-f>  <Plug>(coc-format)
nmap <M-f>  <Plug>(coc-format)
nmap <M-i> :call CocAction('runCommand', 'editor.action.organizeImport')<CR>


" close buffer
nnoremap <C-q> :bd<CR>
nnoremap <leader>Q :bd!<CR>
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-l>   :vertical resize -2<CR>
nnoremap <M-h>    :vertical resize +2<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

" Return to normal mode in terminal
tmap <C-o> <C-\><C-n>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <silent> <leader>fp :Telescope project<CR>

" Using Lua functions
nnoremap <leader>pp :lua require'telescope.builtin'.planets{}<CR>

"""" Indents 
vnoremap < <gv
vnoremap > >gv
"""" Select all 
nnoremap <C-A> ggVG

"""" VIM-TEST 
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
" nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
"nmap <silent> t<C-l> :TestLast<CR>
"nmap <silent> t<C-g> :TestVisit<CR>


""Copy file path to clipboard
" Copy file name
nmap cn :let @*=expand("%")<CR>
" Copy file path
nmap cf :let @*=expand("%:p")<CR>

nnoremap <F4> :call vimspector#Reset()<CR> 

"  Go
nmap <leader>r <Plug>(coc-rename)
nmap <C-d> <Plug>(coc-definition)
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
autocmd BufEnter *.go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
nmap <leader>cr <Plug>(coc-references)


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files find_command=rg,-L,--ignore,--hidden,--files prompt_prefix=🔍<CR>
nnoremap <leader>fg <cmd>Telescope live_grep vimgrep_arguments=rg,-L,--hidden,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--iglob,!.git prompt_prefix=🔍<CR>
nnoremap <leader>fb <cmd>Telescope buffers:CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <silent> <leader>fp :Telescope project<CR>

" GitBlame
let g:blamer_enabled = 1

" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
function! s:copy_git_branch()
  let path = expand("%:p:h")
  exec ":!cd ".path." && git branch --show-current \| tr -d '\\n' \| xclip -selection c"
endfunction
nnoremap <silent> <leader>gc :call <SID>copy_git_branch()<CR>

" Floaterm
nnoremap <silent> tt :FloatermNew<CR>
nnoremap <silent> tp :FloatermPrev<CR>
nnoremap <silent> tn :FloatermNext<CR>
nnoremap <silent> tg :FloatermToggle<CR>
nnoremap <silent> tk :FloatermKill<CR>
nnoremap <silent> tl <Cmd>CocList floaterm<CR>

" Reload vim config
nnoremap <C-r>  :so ~/.config/nvim/init.vim<Cr>

" Rest client
nmap <silent> <leader>ru <Plug>RestNvim
nmap <silent> <leader>rc <Plug>RestNvimPreview
nmap <silent> <leader>rl <Plug>RestNvimLast
