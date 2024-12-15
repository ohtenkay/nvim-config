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
  -- dap = {},
}
