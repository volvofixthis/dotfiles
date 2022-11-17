""" Lua autoformat code

augroup luaFormat
    autocmd!
    autocmd BufWritePost *.lua lua require("stylua").format()
augroup END
