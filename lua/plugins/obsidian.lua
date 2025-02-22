require("obsidian").setup({
	-- A list of workspace names, paths, and configuration overrides.
	-- If you use the Obsidian app, the 'path' of a workspace should generally be
	-- your vault root (where the `.obsidian` folder is located).
	-- When obsidian.nvim is loaded by your plugin manager, it will automatically set
	-- the workspace to the first workspace in the list whose `path` is a parent of the
	-- current markdown file being edited.
	workspaces = {
		{
			name = "Informatica",
			path = "~/Syncthing/Bovedas/Informatica",
		},
	},
	templates = {
		folder = "~/Syncthing/Bovedas/Informatica/Plantillas",
		date_format = "%Y-%m-%d-%a",
		time_format = "%H:%M",
	},
	daily_notes = {
		folder = "Daily",
		date_format = "%Y-%m-%d",
		alias_format = "%B %-d, %Y",
		default_tags = { "daily" },
		template = "daily.md",
	},
	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},
	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		["<leader>gd"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
		["<cr>"] = {
			action = function()
				return require("obsidian").util.smart_action()
			end,
			opts = { buffer = true, expr = true },
		},
	},
	new_notes_location = "notes_subdir",
	note_id_func = function(title)
		local suffix = ""
		if title ~= nil then
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,
	note_path_func = function(spec)
		local path = spec.dir / tostring(spec.id)
		return path:with_suffix(".md")
	end,
	wiki_link_func = function(opts)
		return require("obsidian.util").wiki_link_id_prefix(opts)
	end,
	ui = {
		enable = true,
		update_debounce = 200,
		max_file_length = 5000,
		checkboxes = {
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
			["x"] = { char = "", hl_group = "ObsidianDone" },
			[">"] = { char = "", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			["!"] = { char = "", hl_group = "ObsidianImportant" },
		},
		bullets = { char = "•", hl_group = "ObsidianBullet" },
		external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		hl_groups = {
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ddff" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianImportant = { bold = true, fg = "#d73128" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianBlockID = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},
	attachments = {
		img_folder = "assets/imgs",
		img_name_func = function()
			return string.format("%s-", os.time())
		end,
		img_text_func = function(client, path)
			path = client:vault_relative_path(path) or path
			return string.format("![%s](%s)", path.name, path)
		end,
	},
})

vim.o.conceallevel = 2
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	command = "setlocal conceallevel=2",
})
vim.o.syntax = "on"

vim.api.nvim_create_user_command("DisableMarkdownLint", function()
	require("null-ls").disable({ "markdownlint" })
	print("markdownlint desactivado temporalmente")
end, {})

vim.o.guifont = "FiraCode Nerd Font:h14" -- Cambia "h14" al tamaño deseado
vim.api.nvim_set_hl(0, "markdownH1", { fg = "#FF5733", bold = true }) -- Título H1 en negrita y naranja
vim.api.nvim_set_hl(0, "markdownH2", { fg = "#FFA500", italic = true }) -- Título H2 en cursiva y amarillo
vim.api.nvim_set_hl(0, "markdownRule", { fg = "#808080" }) -- Separadores en gris
