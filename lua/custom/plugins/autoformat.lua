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
        css = { 'deno_fmt' },
        html = { 'deno_fmt' },
        javascript = { 'deno_fmt' },
        typescript = { 'deno_fmt' },
        json = { 'deno_fmt' },
        jsonc = { 'deno_fmt' },
        javascriptreact = { 'deno_fmt' },
        typescriptreact = { 'deno_fmt' },
        -- markdown = { 'deno_fmt' },
        rust = { 'rustfmt' },
      },
    },
  },
}
