local hcl_syntax = function()
    vim.bo.filetype = "hcl"
    vim.bo.commentstring = '// %s'
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.bo.softtabstop = 2
end
require("filetype").setup({
    overrides = {
        extensions = {
            rest = "http",
            sh = "bash",
            enabled = "bash",
            env = "bash",
            c = "c",
            h = "c",
            cpp = "cpp",
            hpp = "cpp",
        },
        function_extensions = {
            ["sql"] = function()
                vim.bo.filetype = "sql"
                vim.bo.syntax = "off"
                vim.keymap.del('i', '<left>', { buffer = true })
                vim.keymap.del('i', '<right>', { buffer = true })
            end,
            ["tf"] = hcl_syntax,
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
            ["c"] = function()
                vim.opt.tabstop = 2
                vim.opt.shiftwidth = 2
                vim.opt.expandtab = true
                vim.bo.softtabstop = 2
            end,
            ["cpp"] = function()
                vim.opt.tabstop = 2
                vim.opt.shiftwidth = 2
                vim.opt.expandtab = true
                vim.bo.softtabstop = 2
            end,
        },
        function_complex = {
            [".*.terraformrc"] = hcl_syntax,
        },
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            [".*.zshrc.d/.*"] = "bash", -- Included in the plugin
        },
    },
})
