"""""" KEYBINDING CONFIG FOR NVIM"""""""""

" close buffer
" nnoremap <C-q> :sil! bp!\|bd! #<CR>
nnoremap <leader>Q :sil! q<CR>
nnoremap <leader>qwo :only<CR>
nnoremap <leader>qb :sil! bp!\|bd!#<CR>
nnoremap <leader>qo :BufOnly<CR>
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
" nnoremap <C-c> <Esc>
" inoremap <C-c> <Esc>
inoremap <Esc> <Esc>`^
au WinLeave * stopinsert

" autosave
autocmd InsertLeave * silent! :if expand('%') != '' | update | endif
if has("gui_running")
  autocmd FocusLost * silent! :wa
endif
autocmd BufLeave * silent! :wa

"""" Indents 
vnoremap <silent> << <gv
vnoremap <silent> >> >gv
"""" Select all 
nnoremap <C-A> ggVG

""Copy file path to clipboard
" Copy file name
nmap <leader>cn :let @*=expand("%")<CR>
" Copy file path
nmap <leader>cf :let @*=expand("%:p")<CR>

"  Go
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
autocmd BufEnter *.go nmap <buffer> <leader>t  <Plug>(go-test)
autocmd BufEnter *.go nmap <buffer> <leader>tf <Plug>(go-test-func)
autocmd BufEnter *.go nmap <buffer> <leader>td :lua require('dap-go').debug_test()<CR>
autocmd BufEnter *.go nmap <buffer> <leader>tl :lua require('dap-go').debug_test_last()<CR>
autocmd BufEnter *.go nmap <buffer> <leader>c  <Plug>(go-coverage-toggle)
autocmd BufEnter *.go nmap <buffer> <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <buffer> <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <buffer> <leader>ci  <Plug>(go-describe)
autocmd BufEnter *.go nmap <buffer> <leader>cc  <Plug>(go-callers)
nmap <leader>cr <Plug>(coc-references)
autocmd BufEnter *.py nmap <buffer> <leader>tc :lua require('dap-python').test_class()<CR>
autocmd BufEnter *.py nmap <buffer> <leader>tf :lua require('dap-python').test_method()<CR>

" Using Lua functions
nnoremap <leader>pp :lua require'telescope.builtin'.planets{}<CR>

" LazyGit
function! GetCurrentGitPath(path)
  " echo "git in: "..a:path
  let path = finddir('.git/..', a:path.';')
  let path = fnamemodify(path, ':p')
  return path
endfunction

function! GetTopModPath(path)
  " echo "git in: "..a:path
  let path = findfile('go.mod', a:path.';')
  let path = fnamemodify(path, ':p:h')
  return path
endfunction

autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()

" Git
function! s:copy_git_branch()
  let path = expand("%:p:h")
  let s = system("cd ".(path)." && git branch --show-current | tr -d '\\n'")
  let @+ = substitute(s, '\n\+$', '', '')
endfunction
nnoremap <silent> <leader>gc :call <SID>copy_git_branch()<CR>

" Copy mode
:function! s:enter_cm()
    exec ":normal! \<s-v>"
    exec ":set mouse-=a"
    exec ":only"
    exec ":setlocal nolist"
    " exec ":IndentBlanklineDisable"
    exec ":setlocal signcolumn=no"
    exec ":setlocal nonumber norelativenumber"
endfunction

nnoremap <silent> <leader>cm :call <SID>enter_cm()<CR>

function! s:show_whitespace()
    exec ":set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
    exec ":set list"
    " exec ":IndentBlanklineEnable"
endfunction

nnoremap <silent> <leader>sw :call <SID>show_whitespace()<CR>
nnoremap <silent> <leader>md :set mouse-=a<CR>
nnoremap <silent> <leader>me :set mouse+=a<CR>

" TAB in general mode will move to text buffer
" nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
" nnoremap <S-TAB> :bprevious<CR>

" Reload vim config
nnoremap <silent> <leader>rs  :so ~/.config/nvim/init.vim<Cr>

" Rest client
nmap <silent> <leader>ru <Plug>RestNvim
nmap <silent> <leader>rc <Plug>RestNvimPreview
nmap <silent> <leader>rl <Plug>RestNvimLast

" Glow
noremap <leader>p :Glow<CR>

" Javascript
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
autocmd FileType rust,go,python,javascript,typescript,json,jsonc set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevel=99
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Buffers
nnoremap <Leader>bp :b>
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

" Loading breakpoints
autocmd BufRead * :lua load_breakpoints()

" Symbol outline
nnoremap <Leader>so :AerialToggle! right<CR>

" 
" autocmd BufReadCmd * :lua print(vim.fn.expand("<afile>"))
