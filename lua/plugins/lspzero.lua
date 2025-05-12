-- INFO: The "Lsp Zero" plugin is a wrapper around Neovim's LSP functionality, designed to simplify the setup
-- of language servers and related tools. It bundles configurations for `nvim-lspconfig`, `mason.nvim`,
-- `nvim-cmp`, and more into an easy-to-use package. It requires: 1) A language server installed for your
-- programming language (managed via `mason.nvim` or manually), 2) Basic knowledge of LSP features like
-- autocompletion, diagnostics, and go-to-definition, and 3) Optional customization of LSP settings if needed.
-- It aims to provide a streamlined experience for beginners while remaining flexible for advanced users.
return { {
	"VonHeikemen/lsp-zero.nvim",
} }
