require("oterm").setup({
	keymaps = { exit = "<C-q>", normal = "<Esc>" },
	name = "Terminal",
})

local open = require("oterm").open

local function get_current_folder_name()
	return vim.fn.resolve(vim.fn.expand("%:p:h"))
end

local function gen_callback(layout)
	return function()
		open({ layout = layout, command = "cd " .. get_current_folder_name() .. " && bash" })
	end
end

vim.api.nvim_set_keymap("n", "<C-t>", "", {
	noremap = true,
	callback = gen_callback("tab"),
})
vim.api.nvim_set_keymap("n", "<Leader>th", "", {
	noremap = true,
	callback = gen_callback("hsplit"),
})
vim.api.nvim_set_keymap("n", "<Leader>tv", "", {
	noremap = true,
	callback = gen_callback("vsplit"),
})
vim.api.nvim_set_keymap("n", "<Leader>tf", "", {
	noremap = true,
	callback = gen_callback("center"),
})
