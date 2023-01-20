"""""" KEYBINDING CONFIG FOR NVIM"""""""""

" <silent> -- выделеное
let mapleader = "/"

" Turn off search highlighting
" nnoremap <esc> :nohlsearch<CR>

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
  echo g:workspace_path
  exec ":CocCommand explorer ".g:workspace_path
endfunction

nnoremap <silent> <M-b> :call <SID>open_explorer_project()<CR>

""""""AUTOCOMPITE SETTINGS"""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm1()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
nnoremap <C-q> :bp\|bd #<CR>
nnoremap <leader>Q :bp\|bd! #<CR>
" Use alt + hjkl to resize windows
" nnoremap <M-j>    :resize -2<CR>
" nnoremap <M-k>    :resize +2<CR>
" nnoremap <M-h>   :vertical resize -2<CR>
" nnoremap <M-l>    :vertical resize +2<CR>

" Movement in insert mode
inoremap <C-h> <C-o><C-w>h
inoremap <C-j> <C-o><C-w>j
inoremap <C-k> <C-o><C-w>k
inoremap <C-l> <C-o><C-w>l
" movement in normal modev
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
" nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>
inoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
inoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
inoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
inoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
inoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
" inoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>
" Also allow line-wise scrolling
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>

" Alternate way to save
" nnoremap <C-s> :w<CR>
" inoremap <C-s> <C-o>:w<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>
inoremap <Esc> <Esc>`^

" Change layout to US on insert leave
autocmd InsertLeave * silent! :!xkblayout-state set 0
" Disable touchpad on insert enter
" autocmd InsertEnter * silent! :!~/bin/touchpad_disable.sh

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
nmap <leader>cn :let @*=expand("%")<CR>
" Copy file path
nmap <leader>cf :let @*=expand("%:p")<CR>

" Debug
nnoremap <F5> :lua require'dap'.continue()<CR> 
" shift + f5
nnoremap <F17> :lua require'dap'.terminate()<CR> 
nnoremap <S-F5> :lua require'dap'.terminate()<CR> 
nnoremap <F10> :lua require'dap'.step_over()<CR> 
nnoremap <F11> :lua require'dap'.step_into()<CR>
" shift + f11
nnoremap <F23> :lua require'dap'.step_out()<CR> 
nnoremap <S-F11> :lua require'dap'.step_out()<CR> 
nnoremap <F9> :lua require'dap'.toggle_breakpoint()<CR> 
nnoremap <F8> :lua require("dapui").toggle()<CR> 

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
function! GetCurrentGitPath(path)
  echo "git in: "..a:path
  let path = finddir('.git/..', a:path.';')
  let path = fnamemodify(path, ':p')
  return path
endfunction
nnoremap <silent> <leader>gg :LazyGitCurrent<CR>

command! LazyGitCurrent call luaeval("require'lazygit'.lazygit(_A[1])", [GetCurrentGitPath(expand('%:p:h'))])
command! -nargs=1 -range LazyGitPath call luaeval("require'lazygit'.lazygit(_A[1])", [<f-args>])

function! s:copy_git_branch()
  let path = expand("%:p:h")
  let s = system("cd ".resolve(path)." && git branch --show-current | tr -d '\\n'")
  let @+ = substitute(s, '\n\+$', '', '')
endfunction
nnoremap <silent> <leader>gc :call <SID>copy_git_branch()<CR>

:function! s:enter_cm()
    exec ":normal! \<s-v>"
    exec ":set mouse-=a"
    exec ":only"
    exec ":setlocal nolist"
    exec ":IndentBlanklineDisable"
    exec ":setlocal signcolumn=no"
    exec ":setlocal nonumber norelativenumber"
endfunction

nnoremap <silent> <leader>cm :call <SID>enter_cm()<CR>

function! s:show_whitespace()
    exec ":set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
    exec ":set list"
    exec ":IndentBlanklineEnable"
endfunction

nnoremap <silent> <leader>sw :call <SID>show_whitespace()<CR>
nnoremap <silent> <leader>md :set mouse-=a<CR>
nnoremap <silent> <leader>me :set mouse+=a<CR>

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
nnoremap <C-M-j> :m .+1<CR>==
nnoremap <C-M-k> :m .-2<CR>==
nnoremap <C-M-h> :MoveHChar(-1)<CR>
nnoremap <C-M-l> :MoveHChar(1)<CR>
inoremap <C-M-j> <Esc>:m .+1<CR>==gi
inoremap <C-M-k> <Esc>:m .-2<CR>==gi
vnoremap <C-M-j> :MoveBlock(1)<CR>
vnoremap <C-M-k> :MoveBlock(-1)<CR>
vnoremap <C-M-h> :MoveHBlock(-1)<CR>
vnoremap <C-M-l> :MoveHBlock(1)<CR>

" move by same keys in every mode
noremap <M-h> h
noremap <M-j> j
noremap <M-k> k
noremap <M-l> l
noremap <M-о> j
noremap <M-л> k
noremap <M-р> h
noremap <M-д> l
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>
inoremap <M-р> <Left>
inoremap <M-о> <Down>
inoremap <M-л> <Up>
inoremap <M-д> <Left>

" SudaWrite
command W :SudaWrite

" Folding
nnoremap <silent> <Space> za
vnoremap <Space> zf
autocmd FileType go,python,javascript,typescript,json,jsonc set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevel=99
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Harpoon
noremap <leader>hs <Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
noremap <leader>hm <Cmd>lua require("harpoon.mark").add_file()<CR>
noremap <leader>hp <Cmd>lua require("harpoon.ui").nav_prev()<CR>
noremap <leader>hn <Cmd>lua require("harpoon.ui").nav_next()<CR>
noremap <leader>hc <Cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>

" Buffers
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>

" Quit
nnoremap <Leader>. :wqa<CR>
nnoremap <Leader>, :qa!<CR>
