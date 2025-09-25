local set = vim.keymap.set

-- Clear hlsearch on pressing <Esc> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Center the cursor when scrolling files
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')

-- Show diagnostic messages in a floating window
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

-- Go to definition
set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to [D]efinition' })
