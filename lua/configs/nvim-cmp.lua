-- Import cmp and luasnip
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    -- Snippet configuration
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- Expand snippet
        end,
    },

    -- Key mappings
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Use Tab to confirm completion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Use Shift+Tab to go to the previous item
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll up in documentation
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll down in documentation
        ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completions
        ["<C-e>"] = cmp.mapping.abort(), -- Close completion
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm completion
    }),
    -- sorting = {
    --     priority_weight = 2, -- Give more weight to priority values
    -- },

    -- Completion sources
    sources = cmp.config.sources({
        { name = "luasnip", priority = 1000 }, -- LuaSnip source for snippets
        { name = "nvim_lsp", priority = 500 }, -- LSP source for completions
    }, {
        { name = "buffer", priority = 300 }, -- Buffer source for words already in the buffer
    }),

    -- Filetype-specific configurations (for gitcommit)
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "cmp_git" }, -- Git-related completions
        }, {
            { name = "buffer" },
        }),
    }),

    -- Command-line setup
    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" }, -- Use buffer completions in command-line
        },
    }),

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" }, -- Use path completions in command-line
        }, {
            { name = "cmdline" }, -- Use cmdline completions
        }),
    }),
})
