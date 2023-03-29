require("legendary").setup({
	keymaps = {
		-- map keys to a command
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
			"BlamerToggle",
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
			description = "Debug toggle breakpoint",
			mode = "n",
		},
		{
			"<leader>dtg",
			":lua require'dapui'.toggle()<CR>",
			description = "Debug toggle dapui",
			mode = "n",
		},
		-- Coc
		{
			"<leader>rn",
			"<Plug>(coc-rename)",
			description = "Coc rename symbol",
			mode = "n",
		},
		{
			"gd",
			"<Plug>(coc-definition)",
			description = "Coc goto definition",
			mode = "n",
		},
		{
			"gy",
			"<Plug>(coc-type-definition)",
			description = "Coc type definition",
			mode = "n",
		},
		{
			"gi",
			"<Plug>(coc-implementation)",
			description = "Coc implementation",
			mode = "n",
		},
		{
			"gr",
			"<Plug>(coc-references)",
			description = "Coc references",
			mode = "n",
		},
		{
			"ga",
			"<Plug>(coc-codeaction-line)",
			description = "Coc codeaction line",
			mode = "n",
		},
		{
			"ga",
			"<Plug>(coc-codeaction-line)",
			description = "Coc codeaction line",
			mode = "x",
		},
		{
			"gA",
			"<Plug>(coc-codeaction)",
			description = "Coc codeaction",
			mode = "n",
		},
		{
			"dte",
			"<Plug>:call CocAction('diagnosticToggle', 1) | call CocAction('diagnosticRefresh')<CR>",
			description = "Coc diagnostic disable",
			mode = "n",
		},
		{
			"dtd",
			":call CocAction('diagnosticToggle', 0) | call CocAction('diagnosticRefresh')<CR>",
			description = "Coc diagnostic enable",
			mode = "n",
		},
		{
			"dr",
			":call CocAction('diagnosticRefresh')<CR>",
			description = "Coc diagnostic refresh",
			mode = "n",
		},
	},
})
