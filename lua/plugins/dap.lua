local dap = require('dap')

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    cwd = '${workspaceFolder}',
    port = 9000,
    stopOnEntry = true,
  },
}

require('dap').adapters.php = {
  type = 'executable',
  command = 'node',
  args = {"~/.local/share/nvim/mason/packages/php-debug-adapter/php-debug-adapter"},
}

-- Ver definicion
vim.api.nvim_set_keymap('n', '<leader>zd', ':lua require("telescope.builtin").lsp_definitions()<CR>', { noremap = true, silent = true })
-- Ver instancias
vim.api.nvim_set_keymap('n', '<leader>zx', ':lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
