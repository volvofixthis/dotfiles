local function gen_callback(layout)
	return function()
		local path = get_current_folder_path()
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
		vim.api.nvim_buf_set_keymap(0, "n", "<C-q>", "", {
			noremap = true,
			callback = function()
				vim.cmd("q!")
			end,
		})
		vim.cmd("startinsert")
	end
end

new_term_tab = gen_callback("tabnew")
new_term_split = gen_callback("split")
new_term_vsplit = gen_callback("vsplit")

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
