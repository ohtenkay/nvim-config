-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Don't have `o` add a comment, has to be here otherwise it get overwritten
vim.api.nvim_create_autocmd('BufEnter', {
  desc = " Don't have `o` add a comment",
  group = vim.api.nvim_create_augroup('remove-formatoptions-o', { clear = true }),
  callback = function()
    vim.opt.formatoptions:remove 'o'
  end,
})
