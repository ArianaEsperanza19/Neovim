local dap = require("dap")

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

require("dap").adapters.php = {
	type = "executable",
	command = "node",
	args = { "php-debug-adapter" },
}

-- Ver definicion
vim.api.nvim_set_keymap(
	"n",
	"<leader>zd",
	':lua require("telescope.builtin").lsp_definitions()<CR>',
	{ noremap = true, silent = true }
)
-- Ver instancias
vim.api.nvim_set_keymap(
	"n",
	"<leader>zx",
	':lua require("telescope.builtin").lsp_references()<CR>',
	{ noremap = true, silent = true }
)
-- Ver información de la función (hover)
vim.api.nvim_set_keymap("n", "<leader>zh", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
