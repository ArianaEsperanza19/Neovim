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
			local dapui = require("dapui")
			-- Configuración de DAP UI
			dapui.setup()

			-- Configurar el adaptador PHP
			dap.adapters.php = {
				type = "executable",
				command = "node",
				args = { "/home/ariana/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
			}

			dap.configurations.php = {
				{
					type = "php",
					request = "launch",
					name = "Listen for Xdebug",
					port = 9003,
					stopOnEntry = false,
				},
			}

			-- Configurar el adaptador C++
			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = "/home/ariana/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
				},
				{
					name = "Attach to gdbserver :1234",
					type = "cppdbg",
					request = "launch",
					MIMode = "gdb",
					miDebuggerServerAddress = "localhost:1234",
					miDebuggerPath = "/usr/bin/gdb",
					cwd = "${workspaceFolder}",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			-- 🔥 Vincular DAP UI con eventos de depuración
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open() -- Abre la interfaz de depuración automáticamente
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close() -- Cierra la interfaz al finalizar la sesión
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- 🔥 Keymaps para DAP UI

			-- Atajos de teclado para nvim-dap
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
			vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", dap.clear_breakpoints, { desc = "DAP: Clear All Breakpoints" })
			vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
			vim.keymap.set("n", "<leader>dc", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })
			vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP: Terminate Debugger" })

			-- Atajos de teclado para nvim-dap-ui
			vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP UI: Toggle UI" })
			vim.keymap.set("n", "<leader>do", dapui.open, { desc = "DAP UI: Open UI" })
			vim.keymap.set("n", "<leader>dC", dapui.close, { desc = "DAP UI: Close UI" })

			-- Autocomandos para abrir/cerrar UI automáticamente (si no lo tienes ya)
			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("DapUI_AutoOpen", { clear = true }),
				pattern = "*.rs", -- O el patrón de archivos que depuras
				callback = function()
					if dap.status ~= "active" then
						dap.listeners.before.attach.dapui_config = function()
							dapui.open()
						end
						dap.listeners.before.launch.dapui_config = function()
							dapui.open()
						end
						dap.listeners.before.event_terminated.dapui_config = function()
							dapui.close()
						end
						dap.listeners.before.event_exited.dapui_config = function()
							dapui.close()
						end
					end
				end,
			})

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
