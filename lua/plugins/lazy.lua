-- ~/.config/nvim/init.lua

-- Añadir lazy.nvim al runtime path
vim.opt.rtp:prepend(vim.fn.expand("~/.config/nvim/lazy/lazy.nvim"))

require("lazy").setup({
  -- Packer (para compatibilidad)
  'wbthomason/packer.nvim',

  -- Temas
  'tiagovla/tokyodark.nvim',
  'cocopon/iceberg.vim',

  -- Iconos
  'nvim-tree/nvim-web-devicons',

  -- Barra
  'feline-nvim/feline.nvim',

  -- Corrector
  'sheerun/vim-polyglot',

  -- Latex
  'lervag/vimtex',

  -- Arbol
  'nvim-tree/nvim-tree.lua',

  -- LSP
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'VonHeikemen/lsp-zero.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  },

  -- Pestañas
  { 'akinsho/bufferline.nvim', tag = '*' },

  -- Markdown
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.cmd([[doautocmd FileType]])
      vim.cmd([[
        function! OpenMarkdownPreview(url)
          let cmd = "firefox --new-window " . shellescape(a:url) . " &"
          call system(cmd)
        endfunction
      ]])
      vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    end,
  },

  -- Autocompletado
  'hrsh7th/nvim-cmp',            -- Motor principal de autocompletado
  'hrsh7th/cmp-nvim-lsp',        -- Integración con LSP
  'hrsh7th/cmp-buffer',          -- Fuente de autocompletado para el contenido del buffer
  'hrsh7th/cmp-path',            -- Fuente de autocompletado para archivos del sistema
  -- 'hrsh7th/cmp-cmdline',      -- Autocompletado para la línea de comandos de Vim
  'saadparwaiz1/cmp_luasnip',    -- Fuente para LuaSnip
  {
    'L3MON4D3/LuaSnip',
    commit = '85c9b3edaa6f5a75bb1d24dc180c15eaea77ad9d',  -- Commit específico
    -- tag = 'v2.2.0',          -- Etiqueta específica
    run = 'make install_jsregexp',  -- Instalar jsregexp (opcional)
  },

  -- Búsqueda
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } },
  },
  'tom-pollak/telescope-marks.nvim',
  'MattesGroeger/vim-bookmarks',

  -- IA
  { 'Exafunction/codeium.vim', event = 'BufEnter' },

  -- Comentar con atajo
  'numToStr/Comment.nvim',

  -- Harpoon
  {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
})

