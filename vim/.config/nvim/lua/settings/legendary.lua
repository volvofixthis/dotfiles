local utils = require "nvim-tree.utils"

require("legendary").setup({
    keymaps = {
        -- map keys to a command
        -- NvimTree
        {
            "<leader>re",
            function()
                local api = require('nvim-tree.api')
                local path = vim.g.workspace_path
                local relative_path = utils.path_relative(get_current_file_path(), path)
                api.tree.change_root(path)
                api.tree.find_file({ buf = relative_path, open = true, focus = true, update_root = false })
            end,
            description = "Reveal file",
            mode = "n",
        },
        {
            "<leader>rf",
            function()
                local api = require('nvim-tree.api')
                api.tree.find_file({ open = true, focus = true, update_root = true })
            end,
            description = "Reveal file",
            mode = "n",
        },
        {
            "<leader>fe",
            function()
                local api = require('nvim-tree.api')
                api.tree.change_root(vim.g.workspace_path)
                api.tree.open({ focus = true })
            end,
            description = "Open file explorer",
            mode = "n",
        },
        {
            "<leader>fh",
            function()
                local api = require('nvim-tree.api')
                api.tree.close()
            end,
            description = "Close file explorer",
            mode = "n",
        },
        {
            "<leader>fc",
            function()
                local api = require('nvim-tree.api')
                api.tree.focus()
            end,
            description = "Focus file explorer",
            mode = "n",
        },
        -- Telescope
        {
            "<leader>ff",
            function()
                local path = get_current_folder_path()
                require("telescope.builtin").find_files({
                    cwd = path,
                    prompt_prefix = "🔍",
                    find_command = {
                        "rg",
                        "-L",
                        "--ignore",
                        "--hidden",
                        "--files",
                        "-g=!.git/",
                        "--iglob=!*.pyc",
                        "-g=!vendor/",
                        "-g=!node_modules/",
                    },
                })
            end,
            description = "Find files",
            mode = "n",
        },
        {
            "<leader>fg",
            function()
                local path = get_current_folder_path()
                require("telescope.builtin").live_grep({
                    cwd = path,
                    prompt_title = "Live grep current directory",
                    prompt_prefix = "🔍",
                    additional_args = {
                        "-L",
                        "--hidden",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "-g=!.git",
                        "--iglob=!*.pyc",
                        "-g=!vendor/",
                        "-g=!node_modules/",
                    },
                })
            end,
            description = "Live grep current directory",
            mode = "n",
        },
        {
            "<leader>fb",
            ":Telescope buffers<CR>",
            description = "Telescope buffers",
            mode = "n",
        },
        {
            "<leader>ft",
            ":Telescope help_tags<CR>",
            description = "Telescope help tags",
            mode = "n",
        },
        -- LazyGit
        {
            "<leader>tg",
            ":lua require('telescope').extensions.lazygit.lazygit()<CR>",
            description = "Git repositories",
            mode = "n",
        },
        {
            "<leader>gg",
            function()
                require("lazygit").lazygit(get_current_git_folder_path())
            end,
            description = "LazyGit",
            mode = "n",
        },
        -- GitBlame
        {
            "<leader>bl",
            ":BlamerToggle<CR>",
            description = "Git Blame",
            mode = "n",
        },
        -- Legendary
        {
            "<leader>ll",
            ":Legendary<CR>",
            description = "Legendary",
            mode = "n",
        },
        {
            "<leader>lk",
            ":Legendary keymaps<CR>",
            description = "Legendary keymaps",
            mode = "n",
        },
        {
            "<leader>lf",
            ":Legendary functions<CR>",
            description = "Legendary functions",
            mode = "n",
        },
        {
            "<leader>lc",
            ":Legendary commands<CR>",
            description = "Legendary commands",
            mode = "n",
        },
        {
            "<leader>la",
            ":Legendary autocmds",
            description = "Legendary autcmds",
            mode = "n",
        },
        -- DAP
        {
            "<leader>dc",
            ":lua require'dap'.continue()<CR>",
            description = "Debug continue",
            mode = "n",
        },
        {
            "<leader>dtr",
            ":lua require'dap'.terminate()<CR>",
            description = "Debug terminate",
            mode = "n",
        },
        {
            "<leader>dot",
            ":lua require'dap'.step_out()<CR>",
            description = "Debug step over",
            mode = "n",
        },
        {
            "<leader>din",
            ":lua require'dap'.step_into()<CR>",
            description = "Debug step out",
            mode = "n",
        },
        {
            "<leader>dov",
            ":lua require'dap'.step_over()<CR>",
            description = "Debug step over",
            mode = "n",
        },
        {
            "<leader>dbs",
            ":lua require'dap'.toggle_breakpoint();store_breakpoints(false)<CR>",
            description = "Debug toggle breakpoint",
            mode = "n",
        },
        {
            "<leader>dbc",
            ":lua require'dap'.clear_breakpoints();store_breakpoints(true)<CR>",
            description = "Debug clear breakpoints",
            mode = "n",
        },
        {
            "<leader>dtg",
            ":lua require'dapui'.toggle()<CR>",
            description = "Debug toggle dapui",
            mode = "n",
        },
        -- Neogen
        {
            "<leader>nt",
            ":lua require('neogen').generate({ type = 'type' })<CR>",
            description = "Generate type doc",
            mode = "n",
        },
        {
            "<leader>nf",
            ":lua require('neogen').generate({ type = 'func' })<CR>",
            description = "Generate func doc",
            mode = "n",
        },
        {
            "<leader>nc",
            ":lua require('neogen').generate({ type = 'class' })<CR>",
            description = "Generate class doc",
            mode = "n",
        },
        {
            "<leader>nl",
            ":lua require('neogen').generate({ type = 'file' })<CR>",
            description = "Generate file doc",
            mode = "n",
        },
        -- ChatGPT
        {
            itemgroup = "chatgpt",
            description = "ChatGPT hotkeys",
            keymaps = {
                {
                    "<C-g>r",
                    { n = ":GpRewrite<cr>", v = ":<C-u>'<,'>GpRewrite<cr>", i = "<cmd>GpRewrite<cr>" },
                    description = "ChatGPT rewrite",
                },
                {
                    "<C-g>i",
                    { n = ":GpImplement<cr>", v = ":<C-u>'<,'>GpImplement<cr>", i = "<cmd>GpImplement<cr>" },
                    description = "ChatGPT implement",
                },
                {
                    "<C-g>a",
                    { n = ":GpPrepend<cr>", v = ":<C-u>'<,'>GpPrepend<cr>", i = "<cmd>GpPrepend<cr>" },
                    description = "ChatGPT append (below)",
                },
                {
                    "<C-g>b",
                    { n = ":GpAppend<cr>", v = ":<C-u>'<,'>GpAppend<cr>", i = "<cmd>GpAppend<cr>" },
                    description = "ChatGPT append (below)",
                },
                {
                    "<C-g>n",
                    { n = ":GpChatNew<cr>", v = ":<C-u>'<,'>GpChatNew<cr>" },
                    description = "ChatGPT new chat",
                },
                {
                    "<C-g>t",
                    { n = ":GpChatToggle<cr>", v = ":<C-u>'<,'>GpChatToggle<cr>" },
                    description = "ChatGPT chat toggle",
                },
                {
                    "<C-g>p",
                    ":<C-u>'<,'>GpChatPaste<cr>",
                    description = "ChatGPT visual chat paste",
                    mode = "v",
                },
                {
                    "<C-g>s",
                    ":<C-u>'<,'>GpCodeSimplify<cr>",
                    description = "ChatGPT visual code simplify",
                    mode = "v",
                },
                {
                    "<C-g>f",
                    ":<C-u>'<,'>GpCodeFormat<cr>",
                    description = "ChatGPT visual code format",
                    mode = "v",
                },
                {
                    "<C-g>v",
                    ":<C-u>'<,'>GpCodeFix<cr>",
                    description = "ChatGPT visual code format",
                    mode = "v",
                },
            },
        },
    },
})
