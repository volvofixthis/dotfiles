local lspformat = require("lsp-format")
local lspsignature = require("lsp_signature")
local navic = require("nvim-navic")
local navbuddy = require("nvim-navbuddy")
vim.g.autoformat = false
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
  c = {
    tab_width = function()
      return vim.opt.shiftwidth:get()
    end,
  },
}
lspformat.disabled_filetypes["kotlin"] = true
lspformat.disabled_filetypes["yaml"] = true
lspsignature.setup({
  hint_enable = false,
})
local prettier = {
  formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
  formatStdin = true,
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("efm", {
  on_attach = lspformat.on_attach,
  init_options = { documentFormatting = true, codeAction = true },

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
            "%f:%l:%c: %trror: %m",
            "%f:%l:%c: %tarning: %m",
            "%f:%l:%c: %tote: %m",
          },
        },
        { formatCommand = "shfmt -ci -s -bn -i 4", formatStdin = true },
      },

      python = {
        { formatCommand = "black -l 120 --quiet -", formatStdin = true },
        { formatCommand = "~/bin/isort-wrapper",    formatStdin = true },
      },

      go = {
        { formatCommand = "goimports", formatStdin = true },
        -- { formatCommand = "go fmt", formatStdin = true },
      },

      kotlin = {
        { formatCommand = "ktlint -F --stdin --log-level=none", formatStdin = true },
      },
    },
  },

  filetypes = { "go", "python", "sh", "json", "bash", "vim", "rust", "kotlin" },
})

vim.lsp.enable("efm")

vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        black = { enabled = false },
        isort = { enabled = false },
        rope_autoimport = { enabled = true },
        rope = { enabled = true },
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },

  on_attach = function(client, buffer)
    client.server_capabilities.documentFormattingProvider = false

    navic.attach(client, buffer)
    navbuddy.attach(client, buffer)

    lspsignature.on_attach({
      bind = true,
      handler_opts = { border = "rounded" },
    }, buffer)
  end,

  capabilities = capabilities,
})

vim.lsp.enable("pylsp")

vim.lsp.config("gopls", {
  init_options = {
    usePlaceholders = false,
    completeUnimported = true,
  },

  on_attach = function(client, buffer)
    lspformat.on_attach(client, buffer)

    navic.attach(client, buffer)
    navbuddy.attach(client, buffer)

    lspsignature.on_attach({
      bind = true,
      handler_opts = { border = "rounded" },
    }, buffer)
  end,

  capabilities = capabilities,
})

vim.lsp.enable("gopls")

vim.lsp.config("lua_ls", {
  on_attach = function(client, buffer)
    navic.attach(client, buffer)
    navbuddy.attach(client, buffer)

    lspformat.on_attach(client, buffer)

    lspsignature.on_attach({
      bind = true,
      handler_opts = { border = "rounded" },
    }, buffer)
  end,

  capabilities = capabilities,

  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable("lua_ls")

local capabilitiesJson = require('cmp_nvim_lsp').default_capabilities()
capabilitiesJson.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("jsonls", {
  capabilities = capabilities,
})

vim.lsp.enable("jsonls")

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },

  on_attach = function(client, buffer)
    lspformat.on_attach(client, buffer)
  end,

  capabilities = capabilities,
})

vim.lsp.enable("clangd")


-- vim.lsp.config("kotlin_language_server", {
--   -- keep your custom binary path
--   cmd = {
--     table.concat({
--       os.getenv("HOME"),
--       "/projects/kotlin-language-server/server/build/install/server/bin/kotlin-language-server",
--     }),
--   },
--
--   init_options = {
--     storagePath = table.concat({ os.getenv("HOME"), "/.local/share/nvim/" }),
--   },
--
--   on_attach = function(client, buffer)
--     -- lspformat.on_attach(client, buffer)
--     client.server_capabilities.documentFormattingProvider = false
--
--     -- (optional guard: avoids errors if a server doesn't support symbols)
--     if client.server_capabilities.documentSymbolProvider then
--       navic.attach(client, buffer)
--       navbuddy.attach(client, buffer)
--     end
--
--     lspsignature.on_attach({
--       bind = true,
--       handler_opts = { border = "rounded" },
--     }, buffer)
--   end,
-- })
--
-- vim.lsp.enable("kotlin_language_server")


vim.lsp.config("kotlin_lsp", {
  -- keep your custom binary path
  cmd = {
    "/opt/kotlin-lsp/kotlin-lsp.sh",
    "--stdio",
  },

  on_attach = function(client, buffer)
    -- lspformat.on_attach(client, buffer)
    client.server_capabilities.documentFormattingProvider = false

    -- (optional guard: avoids errors if a server doesn't support symbols)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, buffer)
      navbuddy.attach(client, buffer)
    end

    lspsignature.on_attach({
      bind = true,
      handler_opts = { border = "rounded" },
    }, buffer)
  end,
})

vim.lsp.enable("kotlin_lsp")

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
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
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
