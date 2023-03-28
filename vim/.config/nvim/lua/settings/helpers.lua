function get_current_folder_path()
	if vim.bo.filetype == "coc-explorer" then
		return vim.fn.ExplorerCurrentDir()
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
