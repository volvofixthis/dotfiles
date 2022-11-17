require("filetype").setup({
	overrides = {
		extensions = {
			rest = "http",
		},
		function_extensions = {
			["sql"] = function()
				vim.bo.filetype = "sql"
				vim.bo.coc_suggest_disable = true
			end,
		},
	},
})
