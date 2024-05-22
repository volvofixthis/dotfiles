require('exrc').setup {
    exrc_name = '.nvim.lua', -- Name of exrc files to use
    on_vim_enter = true, -- Load exrc from current directory on start
    on_dir_changed = true, -- Automatically load exrc files on DirChanged autocmd
    trust_on_write = true, -- Automatically trust when saving exrc file
    use_telescope = true, -- Use telescope instead of vim.ui.select for picking files (if available)
    min_log_level = vim.log.levels.DEBUG, -- Disable notifications below this level (TRACE=most logs)
    lsp = {
        auto_setup = false, -- Automatically configure lspconfig to register on_new_config
    },
    commands = {
        instant_edit_single = true, -- Do not use vim.ui.select if there is only 1 candidate for ExrcEdit* commands
    },
}
