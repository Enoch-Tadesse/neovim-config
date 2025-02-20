local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
-- local i = ls.insert_node

ls.add_snippets("python", {

    s("numMatrix", {
        t({
            "class NumMatrix:",
            "",
            "    def __init__(self, matrix: List[List[int]]):",
            "        self.pre = [[0] * (len(matrix[0])+1) for _ in range(len(matrix)+1)]",
            "        for r in range(len(matrix)):",
            "            for c in range(len(matrix[r])):",
            "                self.pre[r+1][c+1] = matrix[r][c] + self.pre[r+1][c] + self.pre[r][c+1] - self.pre[r][c]",
            "",
            "    def sumRegion(self, row1: int, col1: int, row2: int, col2: int) -> int:",
            "        return self.pre[row2+1][col2+1] - self.pre[row2+1][col1] - self.pre[row1][col2+1] + self.pre[row1][col1]",
        }),
    }),

    s("fast", {
        t({
            "import sys",
            "from collections import Counter, defaultdict",
            "from bisect import bisect_left, bisect_right",
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
        -- i(1, "// Description: Template for a python program."),
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
