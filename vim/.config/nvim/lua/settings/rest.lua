require "rest-nvim".setup {
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = true,
    -- Highlight request on run
    highlight = {
        enabled = true,
        timeout = 5,
    },
    result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
        formatters = {
            json = function(body)
                return vim.fn.system({ "yq", "eval", "... comments=\"\"", "-P", "-o", "json" }, body)
            end,
            html = function(body)
                return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
        },
    },
    -- Jump to request line on run
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
}
