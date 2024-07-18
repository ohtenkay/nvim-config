require('telescope').setup {
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

-- Enable Telescope extensions if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'
local set = vim.keymap.set

set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Slightly advanced example of overriding default behavior and theme
set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
