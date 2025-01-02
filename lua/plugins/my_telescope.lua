local M = {}

-- Función para reemplazar en un solo archivo seleccionado
function M.search_and_replace()
  local opts = {
    prompt_title = "Search and Replace",
    search_dirs = {"."},
    attach_mappings = function(prompt_bufnr, map)
      map('i', '<C-r>', function()
        local action_state = require('telescope.actions.state')
        local current_selection = action_state.get_selected_entry()
        local search_term = action_state.get_current_line()
        local file_path = current_selection.filename
        local replace_term = vim.fn.input("Replace with: ")

        -- Escapa caracteres especiales en los términos de búsqueda y reemplazo
        local function escape(str)
          return vim.fn.escape(str, '/\\')
        end
        local escaped_search_term = escape(search_term)
        local escaped_replace_term = escape(replace_term)

        -- Mensajes de depuración
        print("File: " .. file_path)
        print("Search term: " .. escaped_search_term)
        print("Replace term: " .. escaped_replace_term)

        -- Cierra el buffer de Telescope
        require('telescope.actions').close(prompt_bufnr)

        -- Guarda el buffer actual
        local current_buffer = vim.api.nvim_get_current_buf()
        local current_buffer_number = vim.api.nvim_buf_get_number(current_buffer)

        -- Abre el archivo seleccionado y realiza el reemplazo
        vim.defer_fn(function()
          vim.cmd('edit ' .. file_path)
          local command = string.format('%%s/%s/%s/g', escaped_search_term, escaped_replace_term)
          print("Command: " .. command)
          vim.cmd(command)
          vim.cmd('write')

          -- Regresa al buffer actual
          vim.cmd('buffer ' .. current_buffer_number)
        end, 100)
      end)
      return true
    end,
  }
  require('telescope.builtin').live_grep(opts)
end

-- Función para reemplazar en todos los archivos del directorio
function M.search_and_replace_global()
  local opts = {
    prompt_title = "Search and Replace",
    search_dirs = {"."},
    attach_mappings = function(_, map)
      map('i', '<C-r>', function(prompt_bufnr)
        local action_state = require('telescope.actions.state')
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local search_term = current_picker:_get_prompt()
        local replace_term = vim.fn.input("Replace with: ")

        -- Escapa caracteres especiales en los términos de búsqueda y reemplazo
        local function escape(str)
          return vim.fn.escape(str, '/\\')
        end
        local escaped_search_term = escape(search_term)
        local escaped_replace_term = escape(replace_term)

        -- Mensajes de depuración
        print("Search term: " .. escaped_search_term)
        print("Replace term: " .. escaped_replace_term)

        -- Cierra el buffer de Telescope
        require('telescope.actions').close(prompt_bufnr)

        -- Guarda el buffer actual
        local current_buffer = vim.api.nvim_get_current_buf()
        local current_buffer_number = vim.api.nvim_buf_get_number(current_buffer)

        -- Realiza el reemplazo en todos los archivos del directorio
        vim.defer_fn(function()
          local grep_cmd = string.format('grep -rl "%s" .', escaped_search_term)
          local handle = io.popen(grep_cmd)
          local result = handle:read("*a")
          handle:close()

          for file in result:gmatch("[^\r\n]+") do
            vim.cmd('edit ' .. file)
            local command = string.format('%%s/%s/%s/g', escaped_search_term, escaped_replace_term)
            print("Command: " .. command)
            vim.cmd(command)
            vim.cmd('write')
          end

          -- Regresa al buffer actual
          vim.cmd('buffer ' .. current_buffer_number)
        end, 100)
      end)
      return true
    end,
  }
  require('telescope.builtin').live_grep(opts)
end

return M
