vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        cargo = {
          features = { 'algorithms-pyo3-bindings' },
        },
        check = {
          command = 'clippy',
          -- extraArgs = { '--', '-W', 'clippy::pedantic' },
        },
        checkOnSave = true,
      },
    },
  },
  -- DAP configuration
  -- dap = {},
}
