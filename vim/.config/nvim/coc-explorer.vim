function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute 'cd ' . dir
  execute a:cmd
endfunction

function! s:DisableFileExplorer()
    au! FileExplorer
endfunction

function! s:OpenDirHere(dir)
    if exists("g:first_coc_explorer_opened")
    return -1
    endif

    let g:first_coc_explorer_opened = 1

    if isdirectory(a:dir)
	exec "silent CocCommand explorer --position=left " . a:dir
    endif
endfunction

function! s:init_explorer()
  set winblend=10

  " vim-floaterm
  nmap <buffer> <leader>tt <Cmd>call <SID>exec_cur_dir('FloatermNew')<CR>
  nmap <buffer> <leader>tv <Cmd>call <SID>exec_cur_dir('vsplit term://bash')<CR>
  nmap <buffer> <leader>ts <Cmd>call <SID>exec_cur_dir('split term://bash')<CR>
endfunction

function! s:enter_explorer()
  if &filetype == 'coc-explorer'
    " statusline
    setl statusline=coc-explorer
  endif
endfunction

" Taken from vim-easytree plugin, and changed to use coc-explorer
augroup CocExplorerDefault
    autocmd VimEnter * call <SID>DisableFileExplorer()
    autocmd BufEnter * call <SID>OpenDirHere(expand('<amatch>'))
    autocmd BufEnter * call <SID>enter_explorer()
    autocmd FileType coc-explorer call <SID>init_explorer()
augroup end
