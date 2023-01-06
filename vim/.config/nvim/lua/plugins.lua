vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- use("nathom/filetype.nvim")
	use({ "volvofixthis/rest.nvim", branch = "fixes" })
	use("wesleimp/stylua.nvim")
	use("neovim/nvim-lspconfig")
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
			})
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
	use("doums/oterm.nvim")
	use("fedepujol/move.nvim")
	use("leoluz/nvim-dap-go")
	use("mfussenegger/nvim-dap-python")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("RishabhRD/popfix")
	use("RishabhRD/nvim-cheat.sh")
end)
