vim.api.nvim_set_keymap("n", "<Esc>", "", {
    noremap = true,
    callback = function()
        vim.cmd("nohlsearch")
        if is_module_available("notify") then
            local notify = require("notify")
            notify.dismiss()
        end
        if is_module_available("gp") then
            vim.cmd("GpStop")
        end
    end,
})

vim.api.nvim_set_keymap("n", "<C-s>", "", {
    noremap = true,
    callback = function()
        -- vim.lsp.buf.format({ async = false })
        vim.cmd("Format sync")
        vim.cmd("w")
    end,
})

vim.api.nvim_set_keymap("i", "<C-s>", "", {
    noremap = true,
    callback = function()
        -- vim.lsp.buf.format({ async = false })
        vim.cmd("Format sync")
        vim.cmd("w")
    end,
})
