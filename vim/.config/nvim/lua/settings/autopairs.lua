local npairs = require("nvim-autopairs")

npairs.setup({
    fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0, -- Offset from pattern match
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        cursor_pos_before = true,
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
    },
})
