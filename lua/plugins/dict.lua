-- Dict.nvim is a plugin that provides a dictionary for Neovim. It allows you to look up words in a dictionary and get their definitions, synonyms, antonyms, and more.
-- It's necessary have installed Telescope and at least one diccionary.
-- You may install them by: sudo apt install dict dictd dict-wn dict-gcide dict-freedict-por-eng

vim.keymap.set("n", "<leader>d", '<Cmd>lua require("dict").lookup()<CR>')
require("dict").setup()
