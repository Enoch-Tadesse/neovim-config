local ls = require("luasnip")
local r = ls.restore_node
local d = ls.dynamic_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep

vim.api.nvim_set_keymap("i", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })
vim.api.nvim_set_keymap("s", "<A-.>", [[<cmd>lua require'luasnip'.jump(1)<CR>]], { noremap = true })

vim.api.nvim_set_keymap("i", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })
vim.api.nvim_set_keymap("s", "<A-,>", [[<cmd>lua require'luasnip'.jump(-1)<CR>]], { noremap = true })

ls.add_snippets("cpp", {
    s("prep", {
        t({
            "#include <iostream>",
            "#include <string>",
            "#include <vector>",
            "#include <limits>",
            "#include <algorithm>",
            "#include <set>",
            "#include <unordered_set>",
            "#include <map>",
            "#include <unordered_map>",
            "",
            "using namespace std;",
            "",
        }),
    }),

    s("tcase", {
        t({
            "int t;",
            "cin >> t;",
            "while (t--) {",
            "    ",
        }),
        i(1),
        t({ "", "}" }),
    }),

    s("rint", {
        t("int "),
        i(1, "nums"),
        t({ ";", "cin >> " }),
        rep(1),
        t({ ";", "" }), -- Ends the line after the snippet content
        i(0), -- Final node: moves cursor to a new line ready for further editing
    }),

    s("rstr", {
        t("string "),
        i(1, "word"),
        t({ ";", "cin >> " }),
        rep(1),
        t({ ";", "" }),
        i(0),
    }),

    s("riarr", {
        t("vector<int> "),
        i(1, "arr"),
        t("("),
        i(2, "n"),
        t(")"),
        t({ ";", "for (int &x : " }),
        rep(1),
        t({ "){", "\tcin >> x;", "}" }),
        i(0),
    }),

    s("rsarr", {
        t("vector<string> "),
        i(1, "arr"),
        t("("),
        i(2, "n"),
        t(")"),
        t({ ";", "for (string &s : " }),
        rep(1),
        t({ "){", "\tcin >> s;", "}" }),
        i(0),
    }),

    s("rcstr", {
        t("vector<char> "),
        i(1, "arr"),
        t({ ";", "string s;", "cin >> s;", "" }),
        -- t({ "" }),
        rep(1),
        t(".assign(s.begin(), s.end());"),
        i(0),
    }),

    s("rsmat", {
        t("vector<vector<string>> "),
        i(1, "mat"),
        t({ "(r, vector<string>(c));", "" }),
        t({ "for (int i = 0; i < r; i++)", "\tfor (int j = 0; j < c; j++) {", "\t\tcin >> " }),
        rep(1),
        t({ "[i][j];", "\t}" }),
        i(0),
    }),

    s("rimat", {
        t("vector<vector<int>> "),
        i(1, "mat"),
        t({ "(r, vector<int>(c));", "" }),
        t({ "for (int i = 0; i < r; i++)", "\tfor (int j = 0; j < c; j++) {", "\t\tcin >> " }),
        rep(1),
        t({ "[i][j];", "\t}" }),
        i(0),
    }),
})
