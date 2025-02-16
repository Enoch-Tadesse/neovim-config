local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node

ls.add_snippets("python", {
    s("tcase", {
        t({
            "t = int(input())",
            "for _ in range(t):",
            "    ",
        }),
        -- i(1, "// Description: Template for a python program."),
    }),
    s("rint", {
        t({
            "int(input())",
            "",
        }),
    }),
    s("rstr", {
        t({
            "input()",
            "",
        }),
    }),
    s("riarr", {
        t({
            "list(map(int, input().split()))",
            "",
        }),
    }),
    s("rsarr", {
        t({
            "list(input().split())",
            "",
        }),
    }),

    s("rcstr", {
        t({
            "list(x for x in input())",
            "",
        }),
    }),
    s("rcsmat", {
        t({
            "[[x for x in input()] for _ in range(r)]",
            "",
        }),
    }),
    s("rsmat", {
        t({
            "[list(input().split()) for _ in range(r)]",
            "",
        }),
    }),
    s("rimat", {
        t({
            "[list(map(int,input().split())) for _ in range(r)]",
            "",
        }),
    }),
    s("cpt", {
        t({
            "########## TEMPLATE ##########",

            "def INT():",
            "    return int(input())",
            "",
            "",
            "def STR():",
            "    return input()",
            "",
            "",

            "def ARR(para='i'):",
            "    return list(input().split()) if para != 'i' else list(map(int, input()))",
            "",
            "",

            "def MAT(r, para='i'):",
            "    return (",
            "        [list(input().split()) for _ in range(r)]",
            "        if para != 'i'",

            "        else [list(map(int, input().split())) for _ in range(r)]",
            "    )",
            "",
            "",

            "def CMAT(r, n='s'):",
            "    if n !='s':",
            "        return [[x for x in input()] for _ in range(r)]",
            "    return [[int(x) for x in input()] for _ in range(r)]",
            "",
            "",

            "########## TEMPLATE ##########",
        }),
    }),
})
