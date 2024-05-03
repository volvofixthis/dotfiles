local bookmarks_db = vim.fn.expand "$HOME/.local/share/nvim/.bookmarks"
if not (vim.env.WORKSPACE == nil) then
    bookmarks_db = vim.env.WORKSPACE .. ".bookmarks"
end
require('bookmarks').setup {
    sign_priority = 8, --set bookmark sign priority to cover other sign
    save_file = bookmarks_db, -- bookmarks save file path
    keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
    },
}
require('telescope').load_extension('bookmarks')
