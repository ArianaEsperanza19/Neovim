--INFO: which-key is a plugin for Neovim that displays a popup with possible keybindings of the command you currently type.
return {
	"folke/which-key.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			win = {
				-- don't allow the popup to overlap with the cursor
				no_overlap = true,
				-- width = 1,
				height = { min = 5, max = 25 },
				-- col = 0,
				-- row = math.huge,
				-- border = "none",
				padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
				title = true,
				title_pos = "center",
				zindex = 1000,
				-- Additional vim.wo and vim.bo options
				bo = {},
				wo = {
					-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				},
			},
		})
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
				{ "<leader>s", group = "Markdown", icon = "" },
				{ "<leader>l", group = "Latex", icon = "" },
				{ "<leader><esc>", group = "Escape", icon = "" },
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
			{ "<leader>tb", desc = "Toggle Diagnostics", icon = "" },
			{ "<leader>tc", desc = "Toggle Aerial", icon = "󱘎" },
			{ "<leader>td", desc = "Turnoff Diagnostics", icon = "" },
			{ "<leader>tt", desc = "Comments", icon = "󰒕" },
			{ "<leader>tg", desc = "Search pattern", icon = "" },
			{ "<leader>te", desc = "Messages", icon = "󰍢" },
			{ "<leader>tm", desc = "Marks", icon = "󰛛" },
			{ "<leader>tp", desc = "Clipboard", icon = "" },
			{ "<leader>gb", desc = "Git blame line", icon = "" },
			{ "<leader>di", desc = "Dict", icon = "" },
			{ "<leader>lv", desc = "Vimtex View", icon = "" },
			{ "<leader>lc", desc = "Vimtex View", icon = "󱜧" },
			{ "<leader>sm", desc = "Show markdown", icon = "" },
			{ "<leader>xh", desc = "Horizontal Terminal", icon = "" },
			{ "<leader>xv", desc = "Vertical Terminal", icon = "" },
			{ "<leader>xu", desc = "Open Huefy", icon = "" },
			{ "<leader>xs", desc = "Open Shades", icon = "" },
			{ "<leader>zh", desc = "Watch Info", icon = "" },
			{ "<leader>zx", desc = "Go to implementations", icon = "󰬱" },
			{ "<leader>zd", desc = "Go to definition", icon = "󰊕" },

			{ "]n", desc = "Surround n lineas 󰹹", mode = "n", icon = "󰉸" },
			{ "]y", desc = "Surround linea entera", mode = "n", icon = "󰅩" },
			{ "]Y", desc = "Surround 󰹹 de linea", mode = "n", icon = "󰉸" },
			{ "]v", desc = "Surround visual", mode = "v", icon = "󰅩" },
			{ "]V", desc = "Surround 󰹹 de lineas", mode = "v", icon = "󰉸" },
			{ "]d", desc = "Surround delete", mode = "n", icon = "󰷙" },
			{ "]a", desc = "Surround alter", mode = "n", icon = "" },
			{ "gu", desc = "Lowercase", icon = "" },
			{ "gU", desc = "Uppercase", icon = "" },
		})
	end,
}
