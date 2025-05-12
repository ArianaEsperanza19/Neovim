-- INFO: The DAP (Debug Adapter Protocol) extension for Neovim provides debugging tools,
-- enabling features like breakpoints, variable inspection, and step-through debugging.
-- It requires: 1) A compatible debugger/adapter for the target language (e.g., debugpy for Python),
-- 2) Proper launch configurations for the project, and 3) Plugins like `nvim-dap` for core functionality
-- and optionally `nvim-dap-ui` for a graphical interface to work effectively.
return {
	{
		"mfussenegger/nvim-dap", -- Plugin principal de nvim-dap
		dependencies = {
			"rcarriga/nvim-dap-ui", -- Interfaz gráfica para nvim-dap
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text", -- Muestra información del breakpoint en el buffer
			"nvim-telescope/telescope.nvim", -- Dependencia para Telescope integration
		},
		config = function()
			-- Importar módulos necesarios
			local dap = require("dap")

			-- Configurar el adaptador PHP
			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { "php-debug-adapter" },
			}

			-- Configurar las opciones de depuración para PHP
			dap.configurations.php = {
				{
					type = "php",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					port = 9000,
					stopOnEntry = true,
				},
			}

			-- Keymaps para Telescope y LSP
			vim.api.nvim_set_keymap(
				"n",
				"<leader>zd",
				':lua require("telescope.builtin").lsp_definitions()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>zx",
				':lua require("telescope.builtin").lsp_references()<CR>',
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>zh",
				":lua vim.lsp.buf.hover()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
