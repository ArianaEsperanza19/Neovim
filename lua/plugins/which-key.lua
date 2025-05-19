return {
	"folke/which-key.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({})
		wk.add({
			{
				{ "<leader>f", group = "file", icon = "" }, -- group
				{ "<leader>d", group = "DB", icon = "" },
				{ "<leader>a", group = "Avante", icon = "" },
				{ "<leader>g", group = "Git", icon = "󰊢" },
				{ "<leader>r", group = "Run", icon = "" },
				{ "<leader>z", group = "Info & Def", icon = "" },
				{ "<leader>t", group = "Toggle", icon = "" },
				{ "<leader>w", group = "Window", icon = "" },
				{ "<leader>x", group = "Other", icon = "" },
			},
			{ "<leader>db", ":DBUIToggle<CR>", desc = "Data Base", icon = "" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n", icon = "" },
			{ "<leader>rr", ":lua run_current_file()<CR>", desc = "Run Current File", icon = "" },
			{
				"<leader>F",
				"<cmd>lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == 'null-ls' end })<CR>",
				desc = "Formatear",
				icon = "󰛖",
			},
			{ "<leader>u", desc = "Undo Tree", icon = "󰔱" },
			{ "<leader><Del>", desc = "Delete Buffer", icon = "" },
			{ "<leader>e", desc = "Close Buffer", icon = "" },
			{ "<leader>h", desc = "Stop Search", icon = "󰚫" },
			{ "<leader>o", desc = "New line below", icon = "󰉸" },
			{ "<leader>O", desc = "New line above", icon = "󰉸" },
			{ "<leader>,", desc = "Start of line", icon = "" },
			{ "<leader>.", desc = "End of line", icon = "" },
			{ "<leader>\\", desc = "Open full terminal", icon = " " },
			{ "<leader>wv", desc = "Split vertical win", icon = "" },
			{ "<leader>wh", desc = "Split horizontal win", icon = "" },
			{ "<leader>wq", desc = "Close inactive wins", icon = "" },
			{ "<leader>we", desc = "Close Win", icon = "" },
			{ "<leader>wr", desc = "Resize Win", icon = "" },
			{ "<leader>m", desc = "NeoTree", icon = "󰙅" },
			{ "<leader>tc", desc = "Toggle Aerial", icon = "󱘎" },
			{ "<leader>td", desc = "Turnoff Diagnostics", icon = "" },
			{ "<leader>tt", desc = "Comments", icon = "󰒕" },
			{ "<leader>tg", desc = "Search pattern", icon = "" },
			{ "<leader>te", desc = "Messages", icon = "󰍢" },
			{ "<leader>gb", desc = "Git blame line", icon = "" },
		})
	end,
}
