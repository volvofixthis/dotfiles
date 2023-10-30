local dap = require("dap")
require("dap-python").setup("/usr/bin/python3")
require("dap-python").test_runner = "pytest"
require("dap-python").resolve_python = function()
	local cwd = vim.fn.getcwd()
	if vim.fn.executable(os.getenv("VIRTUAL_ENV") .. "/bin/python") then
		return os.getenv("VIRTUAL_ENV") .. "/bin/python"
	elseif vim.fn.executable(os.getenv("CONDA_PREFIX") .. "/bin/python") then
		return os.getenv("VIRTUAL_ENV") .. "/bin/python"
	elseif vim.fn.executable(cwd .. "/venv/bin/python") then
		return cwd .. "/venv/bin/python"
	elseif vim.fn.executable(cwd .. "/.venv/bin/python") then
		return cwd .. "/.venv/bin/python"
	else
		return "/usr/bin/python3"
	end
end
require('dap-go').setup()
local breakpoints = require("dap.breakpoints")

HOME = os.getenv("HOME")

function _G.store_breakpoints(clear)
	local fp = io.open(HOME .. "/.vim/breakpoints.json", "r")
	local bps = {}
	if fp then
		local content = fp:read("*a")
		bps = vim.fn.json_decode(content)
	end
	local breakpoints_by_buf = breakpoints.get()
	if clear then
		for _, bufrn in ipairs(vim.api.nvim_list_bufs()) do
			local file_path = vim.api.nvim_buf_get_name(bufrn)
			if bps[file_path] ~= nil then
				bps[file_path] = {}
			end
		end
	else
		for buf, buf_bps in pairs(breakpoints_by_buf) do
			bps[vim.api.nvim_buf_get_name(buf)] = buf_bps
		end
	end
	local fp = io.open(HOME .. "/.vim/breakpoints.json", "w")
	local final = vim.fn.json_encode(bps)
	fp:write(final)
	fp:close()
end

function _G.load_breakpoints()
	local fp = io.open(HOME .. "/.vim/breakpoints.json", "r")
	local bps = {}
	if fp then
		local content = fp:read("*a")
		bps = vim.fn.json_decode(content)
	end
	local loaded_buffers = {}
	local found = false
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local file_name = vim.api.nvim_buf_get_name(buf)
		if bps[file_name] ~= nil and bps[file_name] ~= {} then
			found = true
		end
		loaded_buffers[file_name] = buf
	end
	if found == false then
		return
	end
	for path, buf_bps in pairs(bps) do
		for _, bp in pairs(buf_bps) do
			local line = bp.line
			local opts = {
				condition = bp.condition,
				log_message = bp.logMessage,
				hit_condition = bp.hitCondition,
			}
			breakpoints.set(opts, tonumber(loaded_buffers[path]), line)
		end
	end
end

-- dap.adapters.go = function(callback, config)
-- 	local stdout = vim.loop.new_pipe(false)
-- 	local handle
-- 	local pid_or_err
-- 	local port = 38697
-- 	local opts = {
-- 		stdio = { nil, stdout },
-- 		args = { "dap", "-l", "127.0.0.1:" .. port },
-- 		detached = true,
-- 	}
-- 	handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
-- 		stdout:close()
-- 		handle:close()
-- 		if code ~= 0 then
-- 			print("dlv exited with code", code)
-- 		end
-- 	end)
-- 	assert(handle, "Error running dlv: " .. tostring(pid_or_err))
-- 	stdout:read_start(function(err, chunk)
-- 		assert(not err, err)
-- 		if chunk then
-- 			vim.schedule(function()
-- 				require("dap.repl").append(chunk)
-- 			end)
-- 		end
-- 	end)
-- 	-- Wait for delve to start
-- 	vim.defer_fn(function()
-- 		callback({ type = "server", host = "127.0.0.1", port = port })
-- 	end, 100)
-- end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- dap.configurations.go = {
-- 	{
-- 		type = "go",
-- 		name = "Debug",
-- 		request = "launch",
-- 		program = "${file}",
-- 	},
-- 	{
-- 		type = "go",
-- 		name = "Debug test", -- configuration for debugging test files
-- 		request = "launch",
-- 		mode = "test",
-- 		program = "${file}",
-- 	},
-- 	-- works with go.mod packages and sub packages
-- 	{
-- 		type = "go",
-- 		name = "Debug test (go.mod)",
-- 		request = "launch",
-- 		mode = "test",
-- 		program = "${relativeFileDirname}",
-- 	},
-- }
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
	},
}
