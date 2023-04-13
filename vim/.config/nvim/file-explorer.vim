function! s:enterExplorer(dir)
    if exists("g:first_file_explorer_opened")
        return -1
    endif
    let g:first_file_explorer_opened = 1

    if (!empty($WORKSPACE))
        let g:workspace_path = $WORKSPACE
    elseif (isdirectory(a:dir))
        let g:workspace_path = a:dir
    else
        let g:workspace_path = resolve(fnamemodify(a:dir, ':h'))
    endif

    if isdirectory(a:dir)
	    exec "NvimTreeOpen " . g:workspace_path
    endif
endfunction

function! s:initExplorer()
  if &filetype == 'NvimTree'
    " statusline
    setl statusline=NvimTree
  endif
endfunction

" Taken from vim-easytree plugin, and changed to use coc-explorer
augroup CocExplorerDefault
    autocmd BufEnter * call <SID>enterExplorer(expand('<amatch>'))
    autocmd FileType coc-explorer call <SID>initExplorer()
augroup end
