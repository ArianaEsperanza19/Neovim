-- lua/markdownPreview.lua
local M = {}

M.setup = function(use)
  use {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.cmd([[doautocmd FileType markdown]])
      vim.cmd([[
        function! OpenMarkdownPreview(url)
          let cmd = "firefox --new-window " . shellescape(a:url) . " &"
          call system(cmd)
        endfunction
      ]])
      vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    end,
  }
end

return M

