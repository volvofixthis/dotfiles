require("oterm").setup({
	keymaps = { exit = "<C-q>", normal = "<C-o>" },
	name = "Terminal",
})

local open = require("oterm").open

vim.api.nvim_set_keymap("n", "<C-t>", "", {
	noremap = true,
	callback = function()
		open({ layout = "tab" })
	end,
})
vim.api.nvim_set_keymap("n", "<Leader>th", "", {
	noremap = true,
	callback = function()
		open({ layout = "hsplit" })
	end,
})
vim.api.nvim_set_keymap("n", "<Leader>tv", "", {
	noremap = true,
	callback = function()
		open({ layout = "vsplit" })
	end,
})
vim.api.nvim_set_keymap("n", "<Leader>tf", "", {
	noremap = true,
	callback = function()
		open({ layout = "center" })
	end,
})
