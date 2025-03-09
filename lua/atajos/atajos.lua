-- Atajos ------------
vim.api.nvim_create_user_command("KmpGit", function()
	require("atajos.atajos_git").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpEdicion", function()
	require("atajos.atajos_edicion").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNav", function()
	require("atajos.atajos_navegacion").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNavNeotree", function()
	require("atajos.atajos_Neotree").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNavTelescope", function()
	require("atajos.atajos_Telescope").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNavMarks", function()
	require("atajos.atajos_Bookmarks").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpNavWindows", function()
	require("atajos.atajos_ventanas").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpSpell", function()
	require("atajos.atajos_ortografia").show_spell_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpLS", function()
	require("atajos.atajos_letras_simbolos").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpcHtml", function()
	require("atajos.atajos_html").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpcTex", function()
	require("atajos.atajos_Tex").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpcMd", function()
	require("atajos.atajos_Md").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpDebug", function()
	require("atajos.atajos_debug").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpOtros", function()
	require("atajos.atajos_otros").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpClip", function()
	require("atajos.atajos_clipboard").show_keymaps()
end, { nargs = 0 })

vim.api.nvim_create_user_command("KmpDB", function()
	require("atajos.atajos_db").show_keymaps()
end, { nargs = 0 })
