local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer
  -- Temas
  use 'cocopon/iceberg.vim'
  use 'catppuccin/nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-web-devicons' -- Iconos
  use 'feline-nvim/feline.nvim' -- Barra
  use 'sheerun/vim-polyglot' -- Corrector
  use 'lervag/vimtex' -- Latex
  use 'nvim-tree/nvim-tree.lua' -- Arbol
  use 'neovim/nvim-lspconfig' -- LSP
  use 'williamboman/mason.nvim'
  use 'VonHeikemen/lsp-zero.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Pestañas
  use {'akinsho/bufferline.nvim', tag = '*'}

  -- Markdown
use {'toppair/peek.nvim'}
  -- Autocompletion
  use 'hrsh7th/nvim-cmp' -- Motor principal de autocompletado
  use 'hrsh7th/cmp-nvim-lsp' -- Integración con LSP
  use 'hrsh7th/cmp-buffer' -- Fuente de autocompletado para el contenido del buffer
  use 'hrsh7th/cmp-path' -- Fuente de autocompletado para archivos del sistema
  use 'saadparwaiz1/cmp_luasnip' -- Fuente para LuaSnip
  use {
    'L3MON4D3/LuaSnip',
    commit = '85c9b3edaa6f5a75bb1d24dc180c15eaea77ad9d',
    run = 'make install_jsregexp' -- Instalar jsregexp (opcional)
  }

  -- Busqueda
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use 'tom-pollak/telescope-marks.nvim' -- Marcas
  use 'MattesGroeger/vim-bookmarks' -- Marcas
  use 'tpope/vim-abolish' -- Busqueda y sustitucion avanzada

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    commit = 'f197a15b0d1e8d555263af20add51450e5aaa1f0',
    run = ':TSUpdate'
  }

  -- IA
  use {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  }
  use 'numToStr/Comment.nvim' -- Comentar con atajo

  -- Harpoon
  use {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    }
  }
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }

  -- Jump Tag
  use 'harrisoncramer/jump-tag'
  use {'folke/trouble.nvim', commit= '40c5317'}

  if packer_bootstrap then
    require('packer').sync()
  end
  -- git
  use 'tpope/vim-fugitive'
  use {'lewis6991/gitsigns.nvim', commit = ' 0b04035'}
end) -- Fin

