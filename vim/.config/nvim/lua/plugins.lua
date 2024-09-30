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
    use("ray-x/lsp_signature.nvim")
    use("folke/trouble.nvim")
    use({ "volvofixthis/e-kaput.nvim", branch = "fixes" })
    use('dcampos/nvim-snippy')
    use('dcampos/cmp-snippy')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('MattiasMTS/cmp-dbee')
    use('hrsh7th/nvim-cmp')
    use({
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    })
    use({ "fedepujol/move.nvim", commit = "2cd533590" })

    -- DAP
    use({ "volvofixthis/nvim-dap-go", branch = "fixes" })
    use("mfussenegger/nvim-dap-python")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })

    -- cheat
    use("RishabhRD/popfix")
    use("RishabhRD/nvim-cheat.sh")

    -- coc
    -- use({ "neoclide/coc.nvim", branch = "release" })

    -- Nvimtree
    use("nvim-tree/nvim-tree.lua")

    use({ "nvim-treesitter/nvim-treesitter", tag = "v0.9.2" })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" }, },
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
    -- use("tpope/vim-projectionist")

    -- Git
    use("APZelos/blamer.nvim")
    use("volvofixthis/vim-gh-line")

    use("tpope/vim-dispatch")

    use({ "mg979/vim-visual-multi", branch = "master" })

    use("numToStr/Comment.nvim")

    -- use("fatih/vim-go")

    use("gennaro-tedesco/nvim-peekup")

    use({ "lnc3l0t/glow.nvim", branch = "advanced_window" })

    -- Autopairs
    use("windwp/nvim-autopairs")

    use("lambdalisue/suda.vim")

    -- Yank
    use("machakann/vim-highlightedyank")
    use({ "svban/YankAssassin.vim", branch = "main" })

    -- remove buffers without messing layout
    use("moll/vim-bbye")

    use("tpope/vim-unimpaired")

    use({ "alexghergh/nvim-tmux-navigation" })

    use("robitx/gp.nvim")

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

    -- use 'ivanesmantovich/xkbswitch.nvim'

    -- use({
    --     'crusj/bookmarks.nvim',
    --     branch = 'main',
    --     requires = { 'kyazdani42/nvim-web-devicons' },
    --     config = function()
    --         require("bookmarks").setup()
    --         require("telescope").load_extension("bookmarks")
    --     end
    -- })

    use {
        'tomasky/bookmarks.nvim',
        -- tag = 'release' -- To use the latest release
    }

    use {
        'boltlessengineer/bufterm.nvim',
        config = function()
            require('bufterm').setup()
        end,
    }

    use({ "codethread/qmk.nvim", commit = "cfa6ce" })

    use {
        "kndndrj/nvim-dbee",
        run = function()
            require("dbee").install()
        end,
    }

    use("jedrzejboczar/exrc.nvim")

    use("tpope/vim-repeat")
    use("justinmk/vim-sneak")

    use("stevearc/overseer.nvim")

    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "fredrikaverpil/neotest-golang",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-python"
        }
    })

    use('adelarsq/image_preview.nvim')

    if packer_bootstrap then
        require("packer").sync()
    end
end)
