return {
	"nvzone/minty",
	cmd = { "Shades", "Huefy" }, -- Comandos principales del plugin
	dependencies = { "nvzone/volt" }, -- Dependencia necesaria
	config = function()
		-- Configuración del plugin
		require("minty").setup()
	end,
}
