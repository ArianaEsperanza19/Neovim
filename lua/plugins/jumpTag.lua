-- Jump Tag is a Neovim plugin that allows for easy navigation between HTML tags using keyboard shortcuts. It leverages Treesitter's Abstract Syntax Tree (AST) for fast and accurate jumps. This plugin enhances productivity by enabling quick movements to parent, sibling, and child tags within the HTML structure.
-- REQUIERE tener instalado nvim-treesitter 
vim.api.nvim_set_keymap('n', '<leader>p', ':lua require("jump-tag").jumpParent()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>]', ':lua require("jump-tag").jumpNextSibling()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>[', ':lua require("jump-tag").jumpPrevSibling()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>c', ':lua require("jump-tag").jumpChild()<CR>', { noremap = true, silent = true})

