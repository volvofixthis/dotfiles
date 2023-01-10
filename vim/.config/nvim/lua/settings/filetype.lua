require("filetype").setup({
	overrides = {
		extensions = {
			rest = "http",
			enabled = "text",
            sh = "bash",
		},
		function_extensions = {
			["sql"] = function()
				vim.bo.filetype = "sql"
				vim.bo.coc_suggest_disable = true
			end,
		},
		complex = {
			-- Set the filetype of any full filename matching the regex to gitconfig
			[".*.bashrc.d/.*"] = "bash", -- Included in the plugin
		},
	},
})
