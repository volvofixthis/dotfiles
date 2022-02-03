""" Lua autoformat code

function! LuaFormat()
    silent !luafmt % -w replace    
    let view = winsaveview()
    silent<LeftMouse> edit
    call winrestview(view)
    redraw!
endfunction

augroup luaFormat
    autocmd!
    autocmd BufWritePost * if &filetype ==# 'lua' | call LuaFormat() | endif
