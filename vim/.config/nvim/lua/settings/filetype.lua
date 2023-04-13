require("filetype").setup({
    overrides = {
        extensions = {
            rest = "http",
            sh = "bash",
            enabled = "bash",
        },
        function_extensions = {
            ["sql"] = function()
                vim.bo.filetype = "sql"
            end,
            ["gcss"] = function()
                vim.opt.tabstop = 2
                vim.opt.shiftwidth = 2
                vim.opt.expandtab = true
                vim.bo.softtabstop = 2
            end,
            ["tmpl"] = function()
                vim.bo.filetype = "gohtmltmpl"
                vim.opt.tabstop = 2
                vim.opt.shiftwidth = 2
                vim.opt.expandtab = true
                vim.bo.softtabstop = 2
            end,
        },
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            [".*.zshrc.d/.*"] = "bash", -- Included in the plugin
        },
    },
})
