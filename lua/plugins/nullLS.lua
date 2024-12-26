local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = {'toml'},  -- Añadir tipos de archivo adicionales
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.config/nvim/utils/prettier-config/.prettierrc.json')
      }
    }),
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.phpcbf,  -- Formateador para PHP
    null_ls.builtins.formatting.latexindent,-- Formateador para Latex
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci" }  -- Asegura indentación de 2 espacios y bloques de control indentados
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      -- Autocomando para formatear al guardar
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
    -- Mapeo para formatear con <leader>F
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>F', '<cmd>lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == "null-ls" end })<CR>', { noremap = true, silent = true })
  end
})

