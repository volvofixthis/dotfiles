vim.api.nvim_set_keymap("n", "<Esc>", "", {
    noremap = true,
    callback = function()
        vim.cmd("nohlsearch")
        if is_module_available("notify") then
            local notify = require("notify")
            notify.dismiss()
        end
    end,
})

vim.api.nvim_set_keymap("n", "<C-s>", "", {
    noremap = true,
    callback = function()
        vim.lsp.buf.format({ async = true })
        vim.cmd("w")
    end,
})

vim.api.nvim_set_keymap("i", "<C-s>", "", {
    noremap = true,
    callback = function()
        vim.lsp.buf.format({ async = true })
        vim.cmd("w")
    end,
})
