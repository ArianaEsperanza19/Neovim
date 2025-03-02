--[[
The Aerial.nvim  plugin for Neovim provides a code outline window that allows users to efficiently skim through and navigate complex code structures. It is designed to offer a clean, intuitive, and fast way to explore the hierarchy of symbols in your code, such as functions, classes, and variables, enhancing code readability and navigation
]]
--
require("aerial").setup({
	backends = { "lsp", "treesitter", "markdown" }, -- Excluye "php"
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- Mapear el toggle a un atajo (por ejemplo, <leader>a)
vim.api.nvim_set_keymap("n", "<leader>tc", ":AerialNavOpen<CR>", { noremap = true, silent = true })
