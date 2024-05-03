local lspconfig = require("lspconfig")
local lspformat = require("lsp-format")
local lspsignature = require("lsp_signature")
vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = false,
    underline = true,
})
lspformat.setup {
    typescript = {
        tab_width = function()
            return vim.opt.shiftwidth:get()
        end,
    },
    json = {
        tab_width = function()
            return vim.opt.shiftwidth:get()
        end,
    },
    sh = {
        tab_width = function()
            return vim.opt.shiftwidth:get()
        end,
    },
    yaml = { tab_width = 2 },
}
lspsignature.setup({})
local prettier = {
    formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
    formatStdin = true,
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.efm.setup {
    on_attach = lspformat.on_attach,
    init_options = { documentFormatting = true },
    settings = {
        languages = {
            typescript = { prettier },
            yaml = { prettier },
            json = { prettier },
            bash = {
                {
                    lintCommand = "shellcheck -f gcc -x",
                    lintSource = "shellcheck",
                    lintFormats = {
                        "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" }
                },
                { formatCommand = "shfmt -ci -s -bn -i 4", formatStdin = true }
            },
            python = {
                { formatCommand = "black --quiet -",     formatStdin = true },
                { formatCommand = "~/bin/isort-wrapper", formatStdin = true },
            },
            go = {
                { formatCommand = "goimports", formatStdin = true },
                { formatCommand = "gofmt -s",  formatStdin = true },
            },
        },
    },
    filetypes = { 'go', 'python', 'sh', 'yaml', 'json', 'bash', 'vim', 'rust', 'c', 'cpp' }
}
lspconfig.pyright.setup({
    on_attach = function(client, buffer)
        client.config.settings.diagnosticMode = "openFilesOnly"
        client.config.settings.useLibraryCodeForTypes = true
        client.config.settings.autoSearchPaths = true
        client.config.settings.
            client.notify("workspace/didChangeConfiguration")
        client.handlers["textDocument/publishDiagnostics"] = function(...)
        end
        lspformat.on_attach(client, buffer)
        lspsignature.on_attach({
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        }, buffer)
    end,
    capabilities = capabilities
})
lspconfig.rust_analyzer.setup({
    on_attach = function(client, buffer)
        lspformat.on_attach(client, buffer)
        lspsignature.on_attach({
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        }, buffer)
    end,
    capabilities = capabilities
})
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#textDocument_rangeFormatting
lspconfig.gopls.setup({
    on_attach = function(client, buffer)
        client.resolved_capabilities.document_formatting = false
        client.handlers["textDocument/formatting"] = function(...)
        end
        client.handlers["textDocument/rangeFormatting"] = function(...)
        end
        lspsignature.on_attach({
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        }, buffer)
    end,
    cmd = { "gopls", "-remote=unix;/tmp/gopls-daemon-socket" },
    capabilities = capabilities
})
lspconfig.lua_ls.setup({
    on_attach = function(client, buffer)
        lspformat.on_attach(client, buffer)
        lspsignature.on_attach({
            bind = true,
            handler_opts = {
                border = "rounded"
            }
        }, buffer)
    end,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})
local capabilitiesJson = require('cmp_nvim_lsp').default_capabilities()
capabilitiesJson.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup({
    capabilitiesJson = capabilities,
})
-- lspconfig.bashls.setup({ on_attach = lspformat.on_attach, capabilities = capabilities })
require 'lspconfig'.clangd.setup {
    on_attach = function(client, buffer)
        lspformat.on_attach(client, buffer)
    end,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "gA", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set({ "n", "v", "i" }, "<M-f>", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
