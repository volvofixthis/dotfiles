local function get_current_folder_name()
	return vim.fn.resolve(vim.fn.expand("%:p:h"))
end

local function gen_callback(layout)
	return function()
		vim.cmd(":" .. layout .. " | term cd " .. get_current_folder_name() .. " && $SHELL")
		vim.cmd(":file term")
		vim.cmd("startinsert")
	end
end

vim.api.nvim_set_keymap("n", "<C-t>", "", {
	noremap = true,
	callback = gen_callback("tab"),
})
vim.api.nvim_set_keymap("n", "<Leader>th", "", {
	noremap = true,
	callback = gen_callback("split"),
})
vim.api.nvim_set_keymap("n", "<Leader>tv", "", {
	noremap = true,
	callback = gen_callback("vsplit"),
})
vim.api.nvim_set_keymap("t", "<Esc>", "", {
	noremap = true,
	callback = function()
		vim.cmd("stopinsert")
	end,
})
vim.api.nvim_set_keymap("t", "<C-q>", "", {
	noremap = true,
	callback = function()
		vim.cmd("q!")
	end,
})
