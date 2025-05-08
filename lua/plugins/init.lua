return {

    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                javascript = { "eslint_d" },
            },
        },
        config = function()
            require("lint").linters.eslint_d = {
                cmd = "eslint_d",
                stdin = false,
                args = {
                    "--format",
                    "unix",
                },
            }
            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "Telescope", -- Lazy-load on :Telescope command
        config = function()
            require("configs.telescope") -- Load external config file
        end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        -- -@type render.md.UserConfig
        opts = {},
    },

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.dressing").setup()
        end,
    },

    {
        { import = "configs.java" },
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
            -- require("configs.surround")
            -- Configuration here, or leave empty to use defaults
        end,
    },

    {
        "echasnovski/mini.indentscope",
        version = false, -- Use latest commit
        config = function()
            require("configs.indentscope")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("configs.nvim-cmp")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },

    {
        "stevearc/conform.nvim",
        -- event = "BufWritePre", -- uncomment for format on save
        opts = require("configs.conform"),
    },

    {
        "A7lavinraj/assistant.nvim",
        lazy = false,
        enabled = true,
        keys = {
            { "<leader>a", "<cmd>Assistant<cr>", desc = "Assistant.nvim" },
        },
        opts = {
            ui = {
                border = "single",
                diff_mode = true,
            },
        },
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")

            -- Load VSCode-style snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Load custom Lua-based snippets
            require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
            vim.api.nvim_set_keymap("i", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })
            vim.api.nvim_set_keymap("s", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })

            vim.api.nvim_set_keymap("i", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })
            vim.api.nvim_set_keymap("s", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })
        end,
    },
}
