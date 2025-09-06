local set = vim.keymap.set

-- Clear hlsearch on pressing <Esc> in normal mode
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Center the cursor when scrolling files
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
