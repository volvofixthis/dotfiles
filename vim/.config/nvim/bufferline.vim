lua << EOF
require('bufferline').setup {
  options = {
    close_command = "sil! bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "sil! bdelete! %d", -- can be a string | function, see "Mouse actions"
    offsets = {{filetype = "coc-explorer", text = "File Explorer", text_align =  "center"}},
    numbers = function(opts)
        -- return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
           return string.format('%s', opts.ordinal)
    end,
    diagnostics = "coc",
  }
}
EOF
