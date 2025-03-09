-- The snacks.nvim  plugin enhances Neovim by providing seamless Git integration, allowing users to quickly access features like git blame for specific lines . It simplifies retrieving commit details, such as hashes, authors, and dates, directly within the editor, boosting productivity without leaving the workspace .

require("snacks").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	bigfile = { enabled = true },
	dashboard = { enabled = true },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})

vim.keymap.set("n", "<leader>gb", function()
	require("snacks.git").blame_line()
end, { desc = "Git Blame Line" })
