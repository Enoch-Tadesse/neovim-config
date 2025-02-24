local options = {
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "make",
        -- "fish",
        "asm",
        "python",
        "go",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "java",
        "html",
        "css",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
