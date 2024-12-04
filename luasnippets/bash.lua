local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

--Cabecera de bash
ls.add_snippets("bash", {
    s("bash", {
        t("#!/bin/bash"),
        i(0),
    }),
   })

ls.add_snippets("bash", { 
-- For de bash 
    s("bashfor", 
{   t("for ((i = 1; i <= "), 
    i(1, "$limite"), 
    t({ "; i++)); do", "", "" }), 
    i(0), t("done"), }), 
-- For doble 
    s("bashfor2", 
{   t("#!/bin/bash\n\n"), 
    t("for i in {1..10}\n"), 
    t("do\n"), 
    t(" for j in {1..5}\n"), 
    t(" do\n"), 
    t(' echo "i: $i, j: $j"\n'), 
    t(" done\n"), 
    t("done\n"), }), })
