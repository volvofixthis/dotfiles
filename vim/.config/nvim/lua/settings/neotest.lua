local go_config = { -- Specify configuration
    go_test_args = {
        "-v",
        "-race",
        "-count=1",
        "-timeout=60s",
    },
}

require("neotest").setup({
    -- See all config options with :h neotest.Config
    discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 1,
    },
    running = {
        -- Run tests concurrently when an adapter provides multiple commands to run.
        concurrent = true,
    },
    summary = {
        -- Enable/disable animation of icons.
        animated = false,
    },
    adapters = {
        require("neotest-golang")(go_config),
        require("neotest-rust"),
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
    },
})
