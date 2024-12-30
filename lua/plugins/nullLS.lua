-- null-ls is a plugin for Neovim that allows you to use linters, formatters, and other language tools that are not natively supported by the Language Server Protocol (LSP). It provides a flexible and extensible way to integrate these tools directly into the Neovim workflow, leveraging Neovim's LSP client to provide diagnostics, auto-formatting, and more.
local null_ls = require('null-ls')

-- Función para insertar espacios entre los elementos de la tabla de contenidos
local function insert_spaces_in_toc()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local new_lines = {}
  
  for _, line in ipairs(lines) do
    table.insert(new_lines, line)
    if line:match("^%- ") then
      table.insert(new_lines, "")
    end
  end
  
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      extra_filetypes = { 'toml' },
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand('~/.config/nvim/utils/prettier-config/.prettierrc.json')
      }
    }),
    null_ls.builtins.diagnostics.eslint_d,
    -- Formateador para PHP
    null_ls.builtins.formatting.phpcbf,
    -- Formateador para LaTeX
    null_ls.builtins.formatting.latexindent,
    -- Formateador para bash
    null_ls.builtins.formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci" }
    }),
    -- Formateador para Markdown
    null_ls.builtins.formatting.markdown_toc,
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
          insert_spaces_in_toc()  -- Llamar a la función para insertar espacios
        end
      })
    end
    -- Mapeo para formatear con <leader>F
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>F', '<cmd>lua vim.lsp.buf.format({ bufnr = bufnr, filter = function(client) return client.name == "null-ls" end })<CR>', { noremap = true, silent = true })
  end
})

