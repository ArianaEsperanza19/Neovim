-- ~/.config/nvim/lua/plugins/markdownPreview.lua
local M = {}

M.setup = function()
  vim.g.mkdp_auto_start = 0
  vim.g.mkdp_auto_close = 1
  vim.g.mkdp_refresh_slow = 0
  vim.g.mkdp_command_for_global = 0
  vim.g.mkdp_open_to_the_world = 0
  vim.g.mkdp_open_ip = ""
  vim.g.mkdp_browser = ""
  vim.g.mkdp_echo_preview_url = 1
  vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
  vim.g.mkdp_markdown_css = ""
  vim.g.mkdp_highlight_css = ""
  vim.g.mkdp_port = "8080"
  vim.g.mkdp_page_title = "「${name}」"
  vim.g.mkdp_filetypes = { "markdown" }

  vim.cmd([[doautocmd FileType markdown]])

  vim.cmd([[
    function! OpenMarkdownPreview(url)
      let cmd = "zathura" . shellescape(a:url) . " &"
      call system(cmd)
    endfunction
  ]])
end

return M

