return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<Right>'] = { 'select_and_accept' },
    },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
    signature = {
      enabled = true,
      trigger = {
        show_on_keyword = true,
      },
    },
  },
}
