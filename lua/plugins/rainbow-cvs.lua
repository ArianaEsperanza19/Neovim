--INFO: rainbow_csv is a plugin for Neovim that highlights CSV files with different colors for each column.
return {
	"cameron-wags/rainbow_csv.nvim",
	config = function()
		require("rainbow_csv").setup()
	end,
	-- optional lazy-loading below
	module = {
		"rainbow_csv",
		"rainbow_csv.fns",
	},
	ft = {
		"csv",
		"tsv",
		"csv_semicolon",
		"csv_whitespace",
		"csv_pipe",
		"rfc_csv",
		"rfc_semicolon",
	},
}
