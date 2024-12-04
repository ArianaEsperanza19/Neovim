local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("html", {
    s("doc!", {
        t({"<!DOCTYPE html>", ""}),
        t({"<html>", ""}),
        t("<meta charset=\"UTF-8\">", ""),
        t("<style src=\"style.css\"></style>"),
        t({"<title>Document</title>", ""}),
        t({"<head>", ""}),
        t({"</head>", ""}),
        t({"<body>", ""}),
        t({"</body>", ""}),
        t({"<script src=\"script.js\"></script>", ""}),
        t({"</html>", ""}),
    }),
})

