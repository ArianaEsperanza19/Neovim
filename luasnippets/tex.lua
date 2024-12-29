local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
    -- Snippet para negrita
    s("/n", { t("\\textbf{"), i(1, "texto"), t("}") }),
    
    -- Snippet para cursiva
    s("/k", { t("\\textit{"), i(1, "texto"), t("}") }),

    -- Snippet para nota de pie de página
    s("/fp", { t("\\footnote{"), i(1, "nota"), t("}") }),
})

