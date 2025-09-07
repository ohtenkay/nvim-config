return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      vim.cmd [[hi TreesitterContext guibg=NONE ctermbg=NONE]]
      vim.cmd [[hi TreesitterContextLineNumberBottom gui=underline guisp=Grey]]
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'master',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'vim',
        'vimdoc',
        'query',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
