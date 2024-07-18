return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
      },
    },
  },
}
