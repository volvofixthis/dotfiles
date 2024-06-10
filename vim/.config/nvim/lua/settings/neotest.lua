local go_config = { -- Specify configuration
    dap_go_enabled = true,
    go_test_args = {
        "-v",
        "-race",
        "-count=1",
        "-timeout=60s",
    },
}

require("neotest").setup({
    adapters = {
        require("neotest-golang")(go_config),
        require("neotest-rust"),
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
    },
})
