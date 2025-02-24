local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- list of all servers configured.
lspconfig.servers = {
    -- "jdtls",
    "gopls",
    "lua_ls",
    "pyright",
    "clangd",
    "ts_ls",
    "eslint",
}

-- list of servers configured with default config.
local default_servers = { "gopls", "pyright", "clangd", "ts_ls", "eslint" }

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

require("lspconfig").gopls.setup({
    cmd = { "gopls", "-vv", "serve" },
    capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Ensure capabilities are passed
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            -- Key addition for import completion:
            completeUnimported = true, -- Show completions for unimported packages
            usePlaceholders = true, -- Add placeholders for function arguments
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        -- Optional: Map "gd" to Go-to-definition, etc.
    end,
})

-- lspconfig.gopls.setup({
--     cmd = { "gopls", "serve" },
--     filetypes = { "go", "gomod" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             completeUnimported = true,
--             deepCompletion = true,
--             usePlaceholders = true,
--             analyses = {
--                 unusedparams = true,
--                 shadow = true,
--             },
--             staticcheck = true,
--         },
--     },
--     -- Optional: attach additional functions or mappings on LSP attach
--     on_attach = function(client, bufnr)
--         -- For example, you can set up key mappings here.
--         local opts = { noremap = true, silent = true }
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--         -- Add more mappings or settings as desired.
--     end,
-- })

-- lspconfig.gopls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gowork", "gotmpl" },
--     root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             completeUnimported = true,
--             usePlaceholders = true,
--             analyses = {
--                 unusedparams = true,
--             },
--         },
--     },
-- })

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
    cmd = { "pyright-langserver", "--stdio" },
})

-- lspconfig.eslint.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = true
--         on_attach(client, bufnr)
--     end,
--     settings = {
--         format = true, -- Automatically fix lint issues
--         codeActionOnSave = {
--             enable = true,
--             mode = "all",
--         },
--     },
--     on_init = on_init,
--     capabilities = capabilities,
-- })

lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false -- Disable formatting (use Prettier)
        on_attach(client, bufnr)
    end,
    on_init = function(client)
        -- Additional initialization if needed
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
        tsserver = {
            preferences = {
                importModuleSpecifierPreference = "relative",
                quotePreference = "single",
            },
        },
    },
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,

    settings = {
        Lua = {
            diagnostics = {
                -- enable = false, -- Disable all diagnostics from lua_ls
                -- globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
                    vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
                    "${3rd}/love2d/library",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})
