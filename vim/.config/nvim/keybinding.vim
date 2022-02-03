"""""" KEYBINDING CONFIG FOR NVIM"""""""""

" <silent> -- выделеное
let mapleader = "/"

" Turn off search highlighting
nnoremap <esc> :nohlsearch<CR>

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
" CoC actions
nmap <leader>rn <Plug>(coc-rename)


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

" Format code 
xmap <M-f>  <Plug>(coc-format-selected)
nmap <M-f>  <Plug>(coc-format-selected)
xmap <M-f>  <Plug>(coc-format)
nmap <M-f>  <Plug>(coc-format)
nmap <M-i> :call CocAction('runCommand', 'python.sortImports')<CR>


" close buffer
nnoremap <C-q> :bd<CR>
nnoremap <leader>Q :bd!<CR>
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>   :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
" Also allow line-wise scrolling
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>

" Movement in normal mode
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Alternate way to save
nnoremap <C-s> :w<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
inoremap <Esc> <Esc>`^

" Change layout to US on insert leave
autocmd InsertLeave * silent! :!xkblayout-state set 0
" Disable touchpad on insert enter
autocmd InsertEnter * silent! :!~/bin/touchpad_disable.sh

" autosave
autocmd InsertLeave * silent! :if expand('%') != '' | update | endif
if has("gui_running")
  autocmd FocusLost * silent! :wa
endif
autocmd BufLeave * silent! :wa

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
autocmd BufEnter *.go nmap <buffer> <leader>t  <Plug>(go-test)
autocmd BufEnter *.go nmap <buffer> <leader>tf <Plug>(go-test-func)
autocmd BufEnter *.go nmap <buffer> <leader>c  <Plug>(go-coverage-toggle)
autocmd BufEnter *.go nmap <buffer> <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <buffer> <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <buffer> <leader>ci  <Plug>(go-describe)
autocmd BufEnter *.go nmap <buffer> <leader>cc  <Plug>(go-callers)
nmap <leader>cr <Plug>(coc-references)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <Cmd>Telescope find_files find_command=rg,-L,--ignore,--hidden,--files,--iglob,!.git,--iglob,!*.pyc prompt_prefix=🔍<CR>
nnoremap <leader>fg <Cmd>Telescope live_grep vimgrep_arguments=rg,-L,--hidden,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--iglob,!.git,--iglob,!*.pyc prompt_prefix=🔍<CR>
nnoremap <leader>fb <Cmd>Telescope buffers<CR>
nnoremap <leader>fh <Cmd>Telescope help_tags<CR>
nnoremap <silent> <leader>fp :Telescope project<CR>

" Using Lua functions
nnoremap <leader>pp :lua require'telescope.builtin'.planets{}<CR>

" GitBlame
nmap <silent> <leader>bl <Cmd>BlamerToggle<CR>

" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
function! s:copy_git_branch()
  let path = expand("%:p:h")
  exec ":!cd ".path." && git branch --show-current \| tr -d '\\n' \| xclip -selection c"
endfunction
nnoremap <silent> <leader>gc :call <SID>copy_git_branch()<CR>

" Floaterm
" Return to normal mode in terminal
tmap <C-o> <C-\><C-n>
tmap <C-t> <Cmd>FloatermToggle<CR>
nnoremap <silent> <leader>tt <Cmd>FloatermNew<CR>
nnoremap <silent> <leader>tp <Cmd>FloatermPrev<CR>
nnoremap <silent> <leader>tn <Cmd>FloatermNext<CR>
nnoremap <silent> <leader>tg <Cmd>FloatermToggle<CR>
nnoremap <silent> <leader>tk <Cmd>FloatermKill<CR>
nnoremap <silent> <leader>tl <Cmd>CocList floaterm<CR>
tmap <M-p> <C-o><Cmd>FloatermPrev<CR>
tmap <M-n> <C-o><Cmd>FloatermNext<CR>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Reload vim config
nnoremap <silent> <leader>rs  :so ~/.config/nvim/init.vim<Cr>

" Rest client
nmap <silent> <leader>ru <Plug>RestNvim
nmap <silent> <leader>rc <Plug>RestNvimPreview
nmap <silent> <leader>rl <Plug>RestNvimLast

" Glow
noremap <leader>p :Glow<CR>

" Javascript
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
nnoremap <Leader>rt :JSXReplaceTag<CR>

" delete and cut without pain https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/11993928
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
vnoremap <leader>dd ""dd

" Yank
nmap <leader>y <Plug>YADefault
xmap <leader>y <Plug>YADefault

nmap y <Plug>YAMotion
xmap y <Plug>YAVisual
nmap yy <Plug>YALine

" Move lines https://vim.fandom.com/wiki/Moving_lines_up_or_down
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Save with sudo https://www.cyberciti.biz/faq/vim-vi-text-editor-save-file-without-root-permission/
command W :SudaWrite

" Folding
nnoremap <silent> <Space> za
vnoremap <Space> zf
autocmd FileType go,python,javascript,typescript,json,jsonc set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevel=99
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview
