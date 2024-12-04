local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.lua'

if fn.empty(fn.glob(install_path)) then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer
  use 'tiagovla/tokyodark.nvim' -- Tema
  use 'cocopon/iceberg.vim' -- Tema
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
  -- Markdown
use({
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
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
})


use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Autocompletion
 use 'hrsh7th/nvim-cmp' -- Motor principal de autocompletado
  use 'hrsh7th/cmp-nvim-lsp' -- Integración con LSP
   use 'hrsh7th/cmp-buffer' -- Fuente de autocompletado para el contenido del buffer
    use 'hrsh7th/cmp-path' -- Fuente de autocompletado para archivos del sistema
     --use 'hrsh7th/cmp-cmdline' -- Autocompletado para la línea de comandos de Vim
      use 'saadparwaiz1/cmp_luasnip'-- Fuente para LuaSnip
       use {
         'L3MON4D3/LuaSnip',
         commit = '85c9b3edaa6f5a75bb1d24dc180c15eaea77ad9d',
         -- Commit específico 
         --tag = 'v2.2.0', 
         -- Etiqueta específica 
         run = 'make install_jsregexp' -- Instalar jsregexp (opcional)
        }

-- Busqueda
-- Telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  use {'tom-pollak/telescope-marks.nvim'},
  use {'MattesGroeger/vim-bookmarks'},
  requires = { {'nvim-lua/plenary.nvim'} }
}
  -- IA
  use 'Exafunction/codeium.vim'
  event = 'BufEnter'
  use 'numToStr/Comment.nvim' -- Comentar con atajo
  -- Harpoon
  use {
     'theprimeagen/harpoon',
     branch = 'harpoon2',
     requires = {
       'nvim-lua/plenary.nvim',
       'nvim-telescope/telescope.nvim'
     }}
end)
