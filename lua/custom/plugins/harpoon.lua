return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<C-M-j>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-M-k>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-M-l>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-M-;>', function()
      harpoon:list():select(4)
    end)
  end,
}
