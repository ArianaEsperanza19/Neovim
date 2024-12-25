-- local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
--
-- ls.add_snippets("php", {
--     --Ciclos
--     --For
--     s("for", {
--     t("for ($i = 0; $i < "),
--     i(1,"10"),
--     t({"; $i++) {", "","#codigo...","","}"}),
--     }),
--     --Foreach
--     s("foreach", {
--     t("foreach ("),
--     i(1,"$lista"),
--     t(" as "),
--     i(2,"$elemento"),
--     t({")", "","#codigo...","", "}"}),
--     }),
--     --while
--     s("while", {
--     t("while ("),
--     i(1, "$condicion"),
--     t({") {", "\t"}),
--     i(0, "#codigo..."),
--     t({"", "}"}), }),
--     --Do While
--     s("dowhile", {
--     t({"do {", "\t"}),
--     i(0, "#codigo..."),
--     t({"", "} while ("}),
--     i(1, "$condicion"),
--     t({");"}), }),
--     --Clase
--     s("clase", {
--     t("class "),
--     i(1, "NombreClase"),
--     t({" {", "\tprivate $"}),
--     i(2, "propiedad"),
--     t({";", "\tpublic function __construct("}),
--     i(3, "$parametro"),
--     t({") {", "\t\t$this->"}),
--     t(i(2)),
--     t(" = "),
--     t(i(3)),
--     t({";", "\t}", "\tpublic function "}),
--     i(4, "metodo"),
--     t({"() {", "\t\t// código del método", "\t\t"}),
--     i(0),
--     t({"", "\t}", "}"}),
--     }),
--
--     })
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("php", {
    -- Ciclos
    -- For
    s("for", {
        t("for ($i = 0; $i < "),
        i(1,"10"),
        t({"; $i++) {", "    "}),
        i(0, "#codigo..."),
        t({"", "}"}),
    }),
    -- Foreach
    s("foreach", {
        t("foreach ("),
        i(1,"$lista"),
        t(" as "),
        i(2,"$elemento"),
        t({") {", "    "}),
        i(0, "#codigo..."),
        t({"", "}"}),
    }),
    -- While
    s("while", {
        t("while ("),
        i(1, "$condicion"),
        t({") {", "    "}),
        i(0, "#codigo..."),
        t({"", "}"}),
    }),
    -- Do While
    s("dowhile", {
        t({"do {", "    "}),
        i(0, "#codigo..."),
        t({"", "} while ("}),
        i(1, "$condicion"),
        t({");"}),
    }),
    -- Clase con destructor y descripción
    s("clase", {
        t("class "),
        i(1, "NombreClase"),
        t({" {", "    private $"}),
        i(2, "propiedad"),
        t({";", "    public function __construct("}),
        i(3, "$parametro"),
        t({") {", "        $this->$propiedad"}),
        t(i(2)),
        t(" = "),
        t(i(3)),
        t({"$parametro;", "    }", "    // Destructor: Este método se llama automáticamente cuando el objeto es destruido.", "    public function __destruct() {", "        // Código del destructor", "    }", "    public function "}),
        i(4, "metodo"),
        t({"() {", "        // Código del método", "        "}),
        i(0),
        t({"", "    }", "}"}),
    }),
})

