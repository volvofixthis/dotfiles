"""""" KEYBINDING CONFIG FOR NVIM"""""""""

" close buffer
" nnoremap <C-q> :sil! bp!\|bd! #<CR>
nnoremap <Leader>wc :sil! q<CR>
nnoremap <Leader>wo :only<CR>
nnoremap <Leader>bc :sil! bp! \| sil! bd!#<CR>
nnoremap <Leader>bw :w \| sil! bp! \| sil! bd!#<CR>
nnoremap <Leader>bo :BufOnly<CR>
nnoremap <Leader>tc :tabc<CR>
nnoremap <Leader>to :tabo<CR>
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>   :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
tnoremap <M-j>    :resize -2<CR>
tnoremap <M-k>    :resize +2<CR>
tnoremap <M-h>   :vertical resize -2<CR>
tnoremap <M-l>    :vertical resize +2<CR>

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
tnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
tnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
tnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
tnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
tnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
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
nmap <Leader>cn :let @*=expand("%")<CR>
" Copy file path
nmap <Leader>cf :let @*=expand("%:p")<CR>

"  DAP
autocmd BufEnter *.go nmap <buffer> <Leader>td :lua require('dap-go').debug_test()<CR>
autocmd BufEnter *.go nmap <buffer> <Leader>tl :lua require('dap-go').debug_test_last()<CR>
autocmd BufEnter *.py nmap <buffer> <Leader>tc :lua require('dap-python').test_class()<CR>
autocmd BufEnter *.py nmap <buffer> <Leader>tf :lua require('dap-python').test_method()<CR>

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

" Git
function! s:copy_git_branch()
  let path = expand("%:p:h")
  let s = system("cd ".(path)." && git branch --show-current | tr -d '\\n'")
  let @+ = substitute(s, '\n\+$', '', '')
endfunction
nnoremap <silent> <Leader>gc :call <SID>copy_git_branch()<CR>

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

nnoremap <silent> <Leader>cm :call <SID>enter_cm()<CR>

function! s:show_whitespace()
    exec ":set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
    exec ":set list"
    " exec ":IndentBlanklineEnable"
endfunction

nnoremap <silent> <Leader>sw :call <SID>show_whitespace()<CR>
nnoremap <silent> <Leader>md :set mouse-=a<CR>
nnoremap <silent> <Leader>me :set mouse+=a<CR>

" TAB in general mode will move to text buffer
" nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
" nnoremap <S-TAB> :bprevious<CR>

" Reload vim config
nnoremap <silent> <Leader>rs  :so ~/.config/nvim/init.vim<Cr>

" Rest client
nmap <silent> <Leader>ru <Plug>RestNvim
nmap <silent> <Leader>rc <Plug>RestNvimPreview
nmap <silent> <Leader>rl <Plug>RestNvimLast

" Glow
noremap <Leader>p :Glow % keep \| stopinsert<CR>

" delete and cut without pain https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/11993928
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <Leader>d ""d
nnoremap <Leader>D ""D
vnoremap <Leader>d ""d
vnoremap <Leader>dd ""dd

" Yank
nmap <Leader>y <Plug>YADefault
xmap <Leader>y <Plug>YADefault

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
" noremap <M-h> h
" noremap <M-j> j
" noremap <M-k> k
" noremap <M-l> l
" noremap <M-о> j
" noremap <M-л> k
" noremap <M-р> h
" noremap <M-д> l
" inoremap <M-h> <Left>
" inoremap <M-j> <Down>
" inoremap <M-k> <Up>
" inoremap <M-l> <Right>
" inoremap <M-р> <Left>
" inoremap <M-о> <Down>
" inoremap <M-л> <Up>
" inoremap <M-д> <Left>
" tnoremap <M-h> <Left>
" tnoremap <M-j> <Down>
" tnoremap <M-k> <Up>
" tnoremap <M-l> <Right>
" tnoremap <M-р> <Left>
" tnoremap <M-о> <Down>
" tnoremap <M-л> <Up>
" tnoremap <M-д> <Left>

" SudaWrite
command W :SudaWrite

" Folding
nnoremap <silent> <Space> za
vnoremap <Space> zf
autocmd FileType rust,go,python,javascript,typescript,json,jsonc,lua,http set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevel=99
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Buffers
nnoremap <silent><Leader>1 <Cmd>lua require("bufferline").go_to_buffer(1, true)<CR>
nnoremap <silent><Leader>2 <Cmd>lua require("bufferline").go_to_buffer(2, true)<CR>
nnoremap <silent><Leader>3 <Cmd>lua require("bufferline").go_to_buffer(3, true)<CR>
nnoremap <silent><Leader>4 <Cmd>lua require("bufferline").go_to_buffer(4, true)<CR>
nnoremap <silent><Leader>5 <Cmd>lua require("bufferline").go_to_buffer(5, true)<CR>
nnoremap <silent><Leader>6 <Cmd>lua require("bufferline").go_to_buffer(6, true)<CR>
nnoremap <silent><Leader>7 <Cmd>lua require("bufferline").go_to_buffer(7, true)<CR>
nnoremap <silent><Leader>8 <Cmd>lua require("bufferline").go_to_buffer(8, true)<CR>
nnoremap <silent><Leader>9 <Cmd>lua require("bufferline").go_to_buffer(9, true)<CR>
nnoremap <silent><Leader>$ <Cmd>lua require("bufferline").go_to_buffer(-1, true)<CR>
nnoremap <silent>b] :BufferLineCycleNext<CR>
nnoremap <silent>b[ :BufferLineCyclePrev<CR>
nnoremap <silent><Leader>bn :BufferLineMoveNext<CR>
nnoremap <silent><Leader>bp :BufferLineMovePrev<CR>
nnoremap <silent><Leader>be :BufferLineSortByExtension<CR>
nnoremap <silent><Leader>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><Leader>bi :BufferLineTogglePin<CR>
nnoremap <silent>bg :BufferLinePick<CR>

" Quit
nnoremap <Leader>. :wqa<CR>
nnoremap <Leader>, :qa!<CR>

" Loading breakpoints
autocmd BufRead * :lua load_breakpoints()

" Symbol outline
nnoremap <Leader>so :AerialToggle! right<CR>

" 
" autocmd BufReadCmd * :lua print(vim.fn.expand("<afile>"))
