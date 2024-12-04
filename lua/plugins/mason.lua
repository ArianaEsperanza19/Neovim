-- Configurar Mason
require("mason").setup({})

-- Configurar LSP Zero manualmente
local lsp_zero = require('lsp-zero')

-- Configurar servidores LSP
lsp_zero.setup_servers({
    'ts_ls',   -- TypeScript Server (cambiar de 'ts_ls' a 'tsserver')
    'rust_analyzer',
    'pyright',
    'bashls',
    'lua_ls',
    'markdown_oxide',
    'marksman',
    'texlab',
    "clangd",
    -- 'phpcbf' no es un servidor LSP, sino una herramienta de formateo
})

-- Integrar Mason con nvim-lspconfig
require("mason-lspconfig").setup({
    handlers = {lsp_zero.default_setup},
    ensure_installed = { "pyright", "ts_ls", "bashls", "markdown_oxide", "marksman", "texlab", "lua_ls",
    "clangd"},
})

-- Configurar phpcbf como formateador
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.phpcbf
    }
})

local lspconfig = require('lspconfig')
lspconfig.texlab.setup {
cmd = { 'texlab' },
on_attach = function(client, bufnr)
local function buf_set_keymap(...)
vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...)
vim.api.nvim_buf_set_option(bufnr, ...) end
buf_set_keymap('n', 'gD', '<Cmd>TexLabDiagnostics<CR>', { noremap = true, silent = true })
buf_set_keymap('n', 'gd', '<Cmd>TexLabGotoDefinition<CR>', { noremap = true, silent = true })
buf_set_keymap('n', 'K', '<Cmd>TexLabDocumentSymbols<CR>', { noremap = true, silent = true }) end,
}

