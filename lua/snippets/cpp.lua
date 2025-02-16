local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("cpp", {
    -- Competitive programming template
    s("template", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "",
            "int main() {",
            "    ios::sync_with_stdio(0);",
            "    cin.tie(0);",
            "",
            "    // Your code here",
            "",
            "    return 0;",
            "}",
        }),
    }),

    -- "blob" snippet
    s("blob", {
        t('cout << "Hello, World!" << endl;'),
    }),
})
