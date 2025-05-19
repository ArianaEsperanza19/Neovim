-- INFO: alpha-nvim is a minimalistic dashboard for Neovim

return {
	{
		"goolord/alpha-nvim", -- Plugin de alpha-nvim
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Dependencia opcional para iconos
		config = function()
			-- Importar alpha-nvim y el tema dashboard
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Definir la función create_new_file como global
			function create_new_file()
				-- Solicitar el nombre del archivo
				vim.ui.input({ prompt = "Nombre del archivo: ", default = "./" }, function(input)
					if input == nil or input == "" then
						return -- Cancelar si no se ingresa nada
					end

					-- Expandir ~ a $HOME si es necesario
					local file_path = vim.fn.expand(input)

					-- Abrir el archivo
					vim.cmd("edit " .. file_path)
				end)
			end

			-- Configuración del encabezado
			dashboard.section.header.val = {
				[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
				[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
				[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
				[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
				[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
				[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
			}

			-- Botones del dashboard
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file", ":lua create_new_file()<CR>"), -- Crear un nuevo archivo
				dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"), -- Buscar archivos
				dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"), -- Archivos recientes
				dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"), -- Abrir archivo de configuración
				dashboard.button("q", " 	Quit", ":qa<CR>"), -- Salir de Neovim
			}

			-- Configuración adicional
			dashboard.config.layout[1].val = 8 -- Ajustar el espacio superior
			dashboard.config.opts.noautocmd = true

			-- Función para obtener la versión de Neovim
			local function get_nvim_version()
				return vim.fn.system("nvim --version | head -n 1"):gsub("\n", "")
			end

			-- Agrega la versión de Neovim al footer
			dashboard.section.footer.val = "Version: " .. get_nvim_version()

			-- Activar alpha-nvim
			alpha.setup(dashboard.config)
		end,
	},
}
