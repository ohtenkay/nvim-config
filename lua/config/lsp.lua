vim.lsp.enable {
  'lua_ls',
  'kotlin_lsp',
  'ts_ls',
  'svelte',
  'tailwindcss',
}
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('lsp-attach-custom', { clear = true }),
--   callback = function(event)
--     -- Clear references when moving cursor
--     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--       buffer = event.buf,
--       callback = Snacks.words.clear(),
--     })
--   end,
-- })
