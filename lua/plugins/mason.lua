-- INFO: Mason is a portable package manager for Neovim that allows easy installation and management of LSP servers, DAP servers, linters, and formatters[_{{{CITATION{{{_1{GitHub - williamboman/mason.nvim: Portable package manager for Neovim ...](https://github.com/williamboman/mason.nvim). It runs everywhere Neovim runs, making it a versatile tool for enhancing your development environment.
-- Configuración de mason

return {
	{
		"williamboman/mason.nvim", -- Plugin principal de Mason
		config = function()
			-- Configurar Mason
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim", -- Integración entre Mason y LSP
		dependencies = {
			"williamboman/mason.nvim", -- Asegura que Mason se configure primero
			"neovim/nvim-lspconfig", -- Plugin principal de LSP
		},
		config = function()
			-- Integrar Mason con nvim-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ts_ls", -- Cambia 'ts_ls' por 'tsserver'
					"bashls",
					"texlab",
					"lua_ls",
					"clangd",
					"intelephense",
					"sqlls",
				},
			})
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim", -- LSP Zero para simplificar la configuración
		branch = "v3.x", -- Usa la versión más reciente (ajusta según tu versión)
		dependencies = {
			"williamboman/mason.nvim", -- Asegura que Mason esté configurado
			"williamboman/mason-lspconfig.nvim", -- Asegura que Mason-LSPConfig esté configurado
			"neovim/nvim-lspconfig", -- Plugin principal de LSP
		},
		config = function()
			-- Importar módulos necesarios
			local lsp_zero = require("lsp-zero")
			local lspconfig = require("lspconfig")

			-- Configurar servidores LSP con LSP Zero
			lsp_zero.setup_servers({
				"ts_ls", -- TypeScript Server
				"bashls",
				"lua_ls",
				"texlab",
				"clangd",
				"intelephense",
				"sqlls",
			})

			-- Habilitar la función de renombrado en todos los servidores de lenguaje
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.renameProvider = true
						end,
					})
				end,
			})

			-- Configuración específica para TexLab
			lspconfig.texlab.setup({
				cmd = { "texlab" },
				on_attach = function(client, bufnr)
					local function buf_set_keymap(...)
						vim.api.nvim_buf_set_keymap(bufnr, ...)
					end
					local function buf_set_option(...)
						vim.api.nvim_buf_set_option(bufnr, ...)
					end
					buf_set_keymap("n", "gD", "<Cmd>TexLabDiagnostics<CR>", { noremap = true, silent = true })
					buf_set_keymap("n", "gd", "<Cmd>TexLabGotoDefinition<CR>", { noremap = true, silent = true })
					buf_set_keymap("n", "K", "<Cmd>TexLabDocumentSymbols<CR>", { noremap = true, silent = true })
				end,
			})
		end,
	},
}
