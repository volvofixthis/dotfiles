vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    use("nathom/filetype.nvim")
    use({ "volvofixthis/rest.nvim", branch = "fixes" })
    -- use("wesleimp/stylua.nvim")
    use("neovim/nvim-lspconfig")
    use("lukas-reineke/lsp-format.nvim")
    use('dcampos/nvim-snippy')
    use('dcampos/cmp-snippy')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')
    -- use({
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup({
    --             -- add any options here
    --         })
    --     end,
    --     requires = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     },
    -- })
    use({ "fedepujol/move.nvim", commit = "2cd533590" })

    -- DAP
    use("leoluz/nvim-dap-go")
    use("mfussenegger/nvim-dap-python")
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")

    -- cheat
    use("RishabhRD/popfix")
    use("RishabhRD/nvim-cheat.sh")

    -- coc
    -- use({ "neoclide/coc.nvim", branch = "release" })

    -- Nvimtree
    use("nvim-tree/nvim-tree.lua")

    use({ "nvim-treesitter/nvim-treesitter", tag = "v0.9.0" })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    })

    -- Themes
    use("sainnhe/sonokai")

    -- Airlines
    use("vim-airline/vim-airline")
    use("vim-airline/vim-airline-themes")

    -- Icons
    use("kyazdani42/nvim-web-devicons")

    -- Bufferline
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

    -- Workspaces
    use("andreyorst/SimpleWorkspaces.vim")
    use("tpope/vim-projectionist")
    use("ThePrimeagen/harpoon")

    -- Git
    use("APZelos/blamer.nvim")
    -- use("kdheepak/lazygit.nvim")
    use("volvofixthis/vim-gh-line")

    use("tpope/vim-dispatch")

    use({ "mg979/vim-visual-multi", branch = "master" })

    use("numToStr/Comment.nvim")

    use("fatih/vim-go")

    use("gennaro-tedesco/nvim-peekup")

    use({ "ellisonleao/glow.nvim", branch = "main" })

    -- Autopairs
    use("windwp/nvim-autopairs")

    use("lambdalisue/suda.vim")

    -- Yank
    use("machakann/vim-highlightedyank")
    use({ "svban/YankAssassin.vim", branch = "main" })

    -- remove buffers without messing layout
    use("moll/vim-bbye")

    -- indent blankline
    -- use("lukas-reineke/indent-blankline.nvim")

    use("tpope/vim-unimpaired")

    use({ "alexghergh/nvim-tmux-navigation" })

    -- use({
    --     "naps62/pair-gpt.nvim",
    --     config = function()
    --         require("pair-gpt").setup()
    --     end,
    -- })

    use({
        "volvofixthis/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    })

    use("mrjones2014/legendary.nvim")

    use({ "stevearc/dressing.nvim" })

    use({ "numToStr/BufOnly.nvim" })

    use("stevearc/aerial.nvim")

    -- use({
    -- 	"giusgad/pets.nvim",
    -- 	requires = {
    -- 		"edluffy/hologram.nvim",
    -- 		"MunifTanjim/nui.nvim",
    -- 	},
    -- })

    use({
        "danymat/neogen",
        config = function()
            require("neogen").setup({})
        end,
        -- requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        tag = "2.13.2"
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
