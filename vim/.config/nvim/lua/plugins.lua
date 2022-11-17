vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nathom/filetype.nvim")
	use({ "NTBBloodbath/rest.nvim", branch = "main" })
	use("wesleimp/stylua.nvim")
	use "neovim/nvim-lspconfig"
end)
