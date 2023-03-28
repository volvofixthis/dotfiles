function! ExplorerCurrentDir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return resolve(fnamemodify(node_info['fullpath'], ':h'))
endfunction

function! s:disableFileExplorer()
    au! FileExplorer
endfunction

function! s:enterExplorer(dir)
    if exists("g:first_coc_explorer_opened")
        return -1
    endif
    let g:first_coc_explorer_opened = 1
    
    if (!empty($WORKSPACE))
        let g:workspace_path = $WORKSPACE
    elseif (isdirectory(a:dir))
        let g:workspace_path = a:dir
    else
        let g:workspace_path = resolve(fnamemodify(a:dir, ':h'))
    endif

    if isdirectory(a:dir)
	    exec "silent CocCommand explorer --position=left " . g:workspace_path
    endif
endfunction

function! s:initExplorer()
  if &filetype == 'coc-explorer'
    " statusline
    setl statusline=coc-explorer
  endif
endfunction

" Taken from vim-easytree plugin, and changed to use coc-explorer
augroup CocExplorerDefault
    autocmd VimEnter * call <SID>disableFileExplorer()
    autocmd BufEnter * call <SID>enterExplorer(expand('<amatch>'))
    autocmd FileType coc-explorer call <SID>initExplorer()
augroup end
