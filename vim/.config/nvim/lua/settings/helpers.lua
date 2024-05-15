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

function get_current_file_path()
    local nvimtree_api = require("nvim-tree.api")
    if vim.bo.filetype == "NvimTree" then
        return nvimtree_api.tree.get_node_under_cursor().absolute_path
    end
    return vim.fn.resolve(vim.fn.expand("%"))
end

function path_startswith(path1, path2)
    local path1_len = #path1
    local path2_len = #path2
    if path1_len < path2_len then
        return false
    end
    local sub_path = string.sub(path1, 1, path2_len)
    return sub_path == path2
end

local prevGitPath = ""

function get_current_git_folder_path()
    local path = vim.fn.GetCurrentGitPath(get_current_folder_path())
    if (vim.bo.buftype == "terminal") then
        return prevGitPath
    end
    if path == "" then
        path = prevGitPath
    else
        prevGitPath = path
    end
    return path
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

function file_exists(name)
    if type(name) ~= "string" then return false end
    return os.rename(name, name) and true or false
end
