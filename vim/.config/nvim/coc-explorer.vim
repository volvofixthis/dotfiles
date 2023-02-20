function! Explorer_current_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return resolve(fnamemodify(node_info['fullpath'], ':h'))
endfunction

function! s:DisableFileExplorer()
    au! FileExplorer
endfunction

function! s:OpenDirHere(dir)
    if exists("g:first_coc_explorer_opened")
    return -1
    endif

    let g:workspace_path = a:dir
    let g:first_coc_explorer_opened = 1
    if (!empty($WORKSPACE))
        let g:workspace_path = $WORKSPACE
    endif

    if isdirectory(a:dir)
	exec "silent CocCommand explorer --position=left " . a:dir
    endif
endfunction

function! s:init_explorer()
  set winblend=10

  " vim-floaterm
  nmap <buffer> <C-t> :lua explorer_new_term_tab()<CR>
  nmap <buffer> <leader>tv :lua explorer_new_term_vsplit()<CR>
  nmap <buffer> <leader>gg :LazyGitCurrentExplorer<CR>
  command! LazyGitCurrentExplorer call luaeval("require'lazygit'.lazygit(_A[1])", [GetCurrentGitPath(Explorer_current_dir())])
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
