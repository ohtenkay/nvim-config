local bufnr = vim.api.nvim_get_current_buf()

vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        cargo = {
          features = 'all',
        },
      },
    },
  },
  -- DAP configuration
  -- dap = {
  -- },
}

vim.keymap.set('n', '<leader>ca', function()
  vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })
