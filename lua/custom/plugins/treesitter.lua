return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'query',
        'go',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      textobjects = {
        move = {
          enable = true,
          set_jumps = false, -- you can change this if you want.
          goto_next_start = {
            --- ... other keymaps
            [']c'] = { query = '@code_cell.inner', desc = 'next code block' },
          },
          goto_previous_start = {
            --- ... other keymaps
            ['[c'] = { query = '@code_cell.inner', desc = 'previous code block' },
          },
        },
        select = {
          enable = true,
          lookahead = true, -- you can change this if you want
          keymaps = {
            --- ... other keymaps
            ['ic'] = { query = '@code_cell.inner', desc = 'in block' },
            ['ac'] = { query = '@code_cell.outer', desc = 'around block' },
          },
        },
        -- swap = { -- Swap only works with code blocks that are under the same
        --          -- markdown header
        --     enable = true,
        --     swap_next = {
        --         --- ... other keymap
        --         ["<leader>sbl"] = "@code_cell.outer",
        --     },
        --     swap_previous = {
        --         --- ... other keymap
        --         ["<leader>sbh"] = "@code_cell.outer",
        --     },
        -- },
      },
    },
    config = function(_, opts)
      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
