-- null-ls is a plugin for Neovim that allows you to use linters, formatters, and other language tools that are not natively supported by the Language Server Protocol (LSP). It provides a flexible and extensible way to integrate these tools directly into the Neovim workflow, leveraging Neovim's LSP client to provide diagnostics, auto-formatting, and more.

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = { 'sh', 'js', 'jsx', 'php', 'c', 'h' },
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.config/nvim/utils/prettier-config/.prettierrc.json')
      },
      args = { '--config', vim.fn.expand('~/.config/nvim/utils/prettier-config/.prettierrc.json') }
    }),
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.phpcbf.with({
  -- extra_args = { '--standard=PSR2', '--extensions=*.php' }
}),
    null_ls.builtins.formatting.latexindent,
    null_ls.builtins.formatting.shfmt.with({
    }),
    null_ls.builtins.formatting.markdown_toc,
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
              return client.name == 'null-ls'
            end
          })
        end
      })
    end
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>F', '<cmd>lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == "null-ls" end })<CR>', { noremap = true, silent = true })
  end,
  autostart = true, -- Asegúrate de que null-ls se autoinicia
  debug = true, -- Habilitar debug para ver más información en los logs
})




