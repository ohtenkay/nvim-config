return {
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    priority = 100,
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
      },
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      require 'custom.completion'
    end,
  },
}
