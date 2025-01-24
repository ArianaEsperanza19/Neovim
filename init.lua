--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------

-- init.lua -----------
vim.opt.termguicolors = true
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Archivos requeridos-
require("settings")
require("keymaps")
-- Temas
--require('plugins/temas/iceberg')
require("plugins/temas/catppucin")
-- require('plugins/temas/gruvbox')

--require('plugins/bootstrap')
require("plugins/packer")
-- Barra inferior ------
require("plugins/feline")
-- Buffer --------------
require("plugins/bufferLine")
-- Visor ---------------
require("plugins/treesitter")
require("plugins/neotree")
require("plugins/nvim-web-devicons")
require("plugins/telescope")
require("plugins/animation") -- Animaciones
-- Ortografia ----------
require("plugins/vimPoliglot")
require("plugins/vimtex")
-- Markdown ------------
require("plugins/peek")
--require('plugins/harpoon')
-- Autocompletado ------
require("autocompletado")
-- LuaSnip -------------
require("plugins/luasnip")
-- Ruta a tu carpeta de snippets
local snippet_paths = vim.fn.stdpath("config") .. "/luasnippets/"
-- Cargar todos los archivos de snippets en la carpeta
require("luasnip.loaders.from_lua").load({ paths = snippet_paths })
-- LPS y Mason ---------
require("plugins/mason")
require("plugins/noneLS")
-- Comentarios ---------
require("plugins/comment")
require("templates")
-- Marcar de etiquetas
require("plugins/jumpTag")
-- Errores ------------- fallos en su implementacion
require("plugins/trouble")
require("plugins/dap")
-- Lo copiado o cortado en Neovim aparecerá en el clipboard externo
vim.o.clipboard = "unnamedplus"
-- IA ------------------
require("plugins/codeium")
-- Git -------------
require("plugins/gitsigns")
require("plugins/git-fugitive")
-- Terminal -----------
require("plugins/toggleTerm")
-- Calidad de vida ----
require("plugins/nvim-surround")
require("plugins/undotree")
-- Atajos ------------
vim.api.nvim_create_user_command("KmpGit", function()
	require("atajos/atajos_git").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpEdicion", function()
	require("atajos/atajos_edicion").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNav", function()
	require("atajos/atajos_navegacion").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNavNeotree", function()
	require("atajos/atajos_Neotree").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNavTelescope", function()
	require("atajos/atajos_Telescope").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNavMarks", function()
	require("atajos/atajos_Bookmarks").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpSpell", function()
	require("atajos/atajos_ortografia").show_spell_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpLS", function()
	require("atajos/atajos_letras_simbolos").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpcHtml", function()
	require("atajos/atajos_html").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpcTex", function()
	require("atajos/atajos_Tex").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpcMd", function()
	require("atajos/atajos_Md").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpDebug", function()
	require("atajos/atajos_debug").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpOtros", function()
	require("atajos/atajos_otros").show_keymaps()
end, { nargs = 0 })
