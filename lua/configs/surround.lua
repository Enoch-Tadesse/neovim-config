-- Configure nvim-surround with basic settings
require("nvim-surround").setup({
    -- The default mappings for surrounding text
    mappings = {
        -- Add surround mappings for different characters (e.g. parentheses, quotes, etc.)
        insert = "<C-s>", -- To surround the current word/selection in insert mode
        normal = "ys", -- To surround the current text in normal mode
        visual = "S", -- To surround the selection in visual mode
    },

    -- Define what characters can be used to surround text
    surrounds = {
        ["("] = { add = { "(", ")" }, delete = "()", find = "%b()", change = "()" },
        ["{"] = { add = { "{", "}" }, delete = "{}", find = "%b{}", change = "{}" },
        ["["] = { add = { "[", "]" }, delete = "[]", find = "%b[]", change = "[]" },
        ["'"] = { add = { "'", "'" }, delete = "''", find = "'.'", change = "''" },
        ['"'] = { add = { '"', '"' }, delete = '""', find = '".', change = '""' },
        -- Add more characters as needed
    },

    -- Enable surround for text objects
    textobjects = {
        enable = true, -- Enable surround with text objects like "iw" for inner word
    },

    -- Additional configuration options can be added as necessary
})
