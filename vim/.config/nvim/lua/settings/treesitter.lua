require('nvim-treesitter').setup {
  -- It is here ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter
  install_dir = vim.fn.stdpath('data') .. '/site',
}

require('nvim-treesitter').install {
  "go",
  "python",
  "lua",
  "json",
  "c",
  "cpp",
  "http",
  "sql",
  "bash",
  "vim",
  "markdown",
  "markdown_inline",
  "regex",
  "hcl",
  "devicetree",
}
