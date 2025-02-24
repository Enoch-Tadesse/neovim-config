local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

vim.api.nvim_set_keymap("i", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })
vim.api.nvim_set_keymap("s", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })

vim.api.nvim_set_keymap("i", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })
vim.api.nvim_set_keymap("s", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })

ls.add_snippets("python", {

    s("smpre", {
        i(1, "fillhere"),
        t({
            " = deepcopy(",
        }),
        i(2, "nums"),
        t({
            ")",
            "",
            "for nr in range(r):",
            "\tfor nc in range(1, c):",
            "\t\t",
        }),
        rep(1),
        t({
            "[nr][nc] += ",
        }),
        rep(1),
        t({
            "[nr][nc - 1]",
            "",
            "",
        }),
    }),

    s("umpre", {
        i(1, "fillhere"),
        t(" = deepcopy("),
        i(2, "nums"),
        t({ ")", "" }),
        t("for nc in range(c):"),
        t({ "", "\tfor nr in range(1, r):" }),
        t({ "\t\t" }),
        rep(1),
        t("[nr][nc] += "),
        rep(1),
        t({ "[nr - 1][nc]", "", "" }),
    }),

    s("fmpre", {
        i(1, "pmat"),
        t(" = deepcopy("),
        i(2, "nums"),
        t({ ")", "" }),
        t("for nr in range(r):"),
        t({ "", "\tfor nc in range(1, c):", "\t\t" }),
        rep(1),
        t(" [nr][nc] += "),
        rep(1),
        t("[nr][nc-1]"),
        t({ "", "for nc in range(c):", "\tfor nr in range(1, r):", "\t\t" }),
        rep(1),
        t("[nr][nc] += "),
        rep(1),
        t({ "[nr - 1][nc]", "", "" }),
        t(""),
        i(0),
    }),

    s("gridsum", {
        t({
            "(",
        }),
        i(1, "pmat"),
        t({ "    [row2][col2]" }),
        t({ "    - (" }),
        rep(1),
        t({ "[row1 - 1][col2] if row1 > 0 else 0)" }),

        t({ "    - (" }),
        rep(1),
        t({ "[row2][col1 - 1] if col1 > 0 else 0)" }),

        t({ "    + (" }),
        rep(1),
        t({ "[row1 - 1][col1 - 1] if row1 > 0 and col1 > 0 else 0)" }),
        t({ ")" }),
    }),

    s("fast", {
        t({
            "import sys",
            "from collections import Counter, defaultdict",
            "from bisect import bisect_left, bisect_right",
            "from copy import deepcopy",
            "",
            "input = sys.stdin.read",
            "",
        }),
    }),

    s("tcase", {
        t({
            "t = int(sys.stdin.readline())",
            "for _ in range(t):",
            "    ",
        }),
    }),

    s("rint", {
        t({
            "int(sys.stdin.readline())",
            "",
        }),
    }),

    s("rstr", {
        t({
            "sys.stdin.readline().strip()",
            "",
        }),
    }),

    s("riarr", {
        t({
            "list(map(int, sys.stdin.readline().split()))",
            "",
        }),
    }),

    s("rsarr", {
        t({
            "sys.stdin.readline().split()",
            "",
        }),
    }),

    s("rcstr", {
        t({
            "list(x for x in sys.stdin.readline().strip())",
            "",
        }),
    }),

    s("rcsmat", {
        t({
            "[[x for x in sys.stdin.readline().strip()] for _ in range(r)]",
            "",
        }),
    }),

    s("rsmat", {
        t({
            "[list(sys.stdin.readline().split()) for _ in range(r)]",
            "",
        }),
    }),

    s("rimat", {
        t({
            "[list(map(int,sys.stdin.readline.split())) for _ in range(r)]",
            "",
        }),
    }),
})
