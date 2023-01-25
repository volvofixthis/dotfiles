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
	},
})
