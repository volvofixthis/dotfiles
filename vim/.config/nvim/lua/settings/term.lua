local function get_current_folder_name()
	return vim.fn.resolve(vim.fn.expand("%:p:h"))
end

local function gen_callback(layout, pwd_func)
	return function()
		path = pwd_func()
		vim.cmd(layout)
		vim.cmd("term cd " .. path .. " && $SHELL && alias vim='nvr --remote-tab'")
		vim.cmd("file term" .. vim.fn.bufnr())
		vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "", {
			noremap = true,
			callback = function()
				vim.cmd("stopinsert")
			end,
		})
		vim.api.nvim_buf_set_keymap(0, "t", "<C-q>", "", {
			noremap = true,
			callback = function()
				vim.cmd("q!")
			end,
		})
		vim.cmd("startinsert")
	end
end

explorer_new_term_tab = gen_callback("tabnew", vim.fn.Explorer_current_dir)
explorer_new_term_vsplit = gen_callback("vsplit", vim.fn.Explorer_current_dir)
new_term_tab = gen_callback("tabnew", get_current_folder_name)
new_term_split = gen_callback("split", get_current_folder_name)
new_term_vsplit = gen_callback("vsplit", get_current_folder_name)

vim.api.nvim_set_keymap("n", "<C-t>", "", {
	noremap = true,
	callback = new_term_tab,
})
vim.api.nvim_set_keymap("n", "<Leader>th", "", {
	noremap = true,
	callback = new_term_split,
})
vim.api.nvim_set_keymap("n", "<Leader>tv", "", {
	noremap = true,
	callback = new_term_vsplit,
})
