require("legendary").setup({
	keymaps = {
		-- map keys to a command
		-- Telescope
		{
			"<leader>ff",
			":Telescope find_files find_command=rg,-L,--ignore,--hidden,--files,--iglob,!.git,--iglob,!*.pyc prompt_prefix=🔍<CR>",
			description = "Find files",
		},
		{
			"<leader>fg",
			":Telescope live_grep vimgrep_arguments=rg,-L,--hidden,--color=never,--no-heading,--with-filename,--line-number,--column,--smart-case,--iglob,!.git,--iglob,!*.pyc prompt_prefix=🔍<CR>",
			description = "Live grep",
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
		},
		{
			"<leader>ll",
			":Legendary<CR>",
			description = "Legendary",
			mode = "n",
		},
		-- Legendary
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
