function get_current_folder_path()
    local nvimtree_api = require("nvim-tree.api")
    if vim.bo.filetype == "NvimTree" then
        local folder_path = nvimtree_api.tree.get_node_under_cursor().absolute_path
        folder_path = vim.fn.resolve(folder_path)
        if vim.fn.isdirectory(folder_path) == 0 then
            folder_path = vim.fn.fnamemodify(folder_path, ":h")
        end
        return folder_path
    end
    return vim.fn.resolve(vim.fn.expand("%:p:h"))
end

function get_current_git_folder_path()
    return vim.fn.GetCurrentGitPath(get_current_folder_path())
end

function is_module_available(name)
    if package.loaded[name] then
        return true
    else
        for _, searcher in ipairs(package.searchers or package.loaders) do
            local loader = searcher(name)
            if type(loader) == "function" then
                package.preload[name] = loader
                return true
            end
        end
        return false
    end
end
