vim.api.nvim_create_autocmd('User', {
  pattern = 'FugitiveCommand',
  callback = function()
    vim.cmd('vertical botright 50vsplit')
  end,
})
vim.api.nvim_create_autocmd('BufReadCmd', {
  pattern = 'fugitive://*',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'bufhidden', 'hide')
  end,
})


vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fugitive',
  callback = function()
    vim.api.nvim_buf_set_option(0, 'syntax', 'gitstatus')
    vim.api.nvim_buf_set_option(0, 'formatoptions', 'c')
    vim.api.nvim_buf_set_option(0, 'formatlistpat', '^\\s*\\d\\+\\s*\\(.*\\)$')

    -- vim.api.nvim_highlight('gitstatusHeader', { link = 'Title' })
    -- vim.api.nvim_highlight('gitstatusAdded', { link = 'Green' })
    -- vim.api.nvim_highlight('gitstatusChanged', { link = 'Yellow' })
    -- vim.api.nvim_highlight('gitstatusDeleted', { link = 'Red' })
    -- vim.api.nvim_highlight('gitstatusUntracked', { link = 'Cyan' })
  end,
})
