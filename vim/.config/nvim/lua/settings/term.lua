local function gen_callback(layout)
    return function()
        local path = get_current_folder_path()
        vim.cmd(layout)
        vim.cmd("term cd " .. path .. " && $SHELL")
        vim.cmd("file term" .. vim.fn.bufnr())
        vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "", {
            noremap = true,
            callback = function()
                vim.cmd.stopinsert()
            end,
        })
        vim.api.nvim_buf_set_keymap(0, "t", "<C-q>", "", {
            noremap = true,
            callback = function()
                vim.cmd("sil! bp! | sil! bd!#")
            end,
        })
        vim.api.nvim_buf_set_keymap(0, "n", "<C-q>", "", {
            noremap = true,
            callback = function()
                vim.cmd("sil! bp! | sil! bd!#")
            end,
        })
        vim.cmd.startinsert()
    end
end

local new_term_tab    = gen_callback("tabnew")
local new_right       = gen_callback("wincmd l")
local new_term_split  = gen_callback("split")
local new_term_vsplit = gen_callback("vsplit")

local term            = require('bufterm.terminal')

vim.api.nvim_set_keymap("n", "<Leader>te", "", {
    noremap = true,
    callback = function()
        if vim.bo.buftype == 'terminal' then return end
        -- get latest terminal buffer (create new if none)
        local t = term.get_recent_term()
        if not t then
            new_right()
        else
            -- enter latest terminal buffer
            t:enter()
        end
    end,
})
vim.api.nvim_set_keymap("n", "<C-t>", "", {
    noremap = true,
    callback = new_right,
})
vim.api.nvim_set_keymap("n", "<Leader>th", "", {
    noremap = true,
    callback = new_term_split,
})
vim.api.nvim_set_keymap("n", "<Leader>tv", "", {
    noremap = true,
    callback = new_term_vsplit,
})
vim.api.nvim_set_keymap("n", "<Leader>gg", "", {
    noremap = true,
    callback = function()
        local path = get_current_git_folder_path()
        vim.cmd("wincmd l")
        vim.cmd("term cd " .. path .. " && lazygit")
        vim.cmd("file lazygit" .. vim.fn.bufnr())
        vim.api.nvim_buf_set_keymap(0, "t", "<C-q>", "", {
            noremap = true,
            callback = function()
                vim.cmd("stopinsert")
            end,
        })
        vim.api.nvim_buf_set_keymap(0, "n", "<C-q>", "", {
            noremap = true,
            callback = function()
                vim.cmd("q!")
            end,
        })
        vim.cmd.startinsert()
    end
})
