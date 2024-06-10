vim.opt.termguicolors = true
require("bufferline").setup({
    options = {
        close_command = "wincmd l | sil! bp! | sil! bd! %d",       -- can be a string | function, see "Mouse actions"
        left_mouse_command = "wincmd t | wincmd 1 l | buffer %d",
        right_mouse_command = "wincmd l | sil! bp! | sil! bd! %d", -- can be a string | function, see "Mouse actions"
        offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
        numbers = function(opts)
            -- return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
            return string.format("%s", opts.ordinal)
        end,
        diagnostics = "coc",
    },
})
