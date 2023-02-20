local notify = require("notify")

vim.api.nvim_set_keymap("n", "<Esc>", "", {
	noremap = true,
	callback = function()
		notify.dismiss()
		vim.cmd("nohlsearch")
	end,
})

vim.api.nvim_set_keymap("n", "<C-s>", "", {
	noremap = true,
	callback = function()
		vim.cmd("w")
	end,
})

vim.api.nvim_set_keymap("i", "<C-s>", "", {
	noremap = true,
	callback = function()
		vim.cmd("w")
	end,
})
