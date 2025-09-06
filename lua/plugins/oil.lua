return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
        },
        win_options = {
          signcolumn = 'yes',
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            return vim.startswith(name, '..')
          end,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil --preview<CR>', { desc = 'Open parent directory' })
    end,
  },
}
