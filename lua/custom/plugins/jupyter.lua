return {
  {
    'benlubas/molten-nvim',
    -- enabled = false,
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    init = function()
      vim.g.python3_host_prog = vim.fn.expand '~/.virtualenvs/.venv/bin/python3'

      vim.keymap.set('n', '<localleader>mi', ':MoltenInit<CR>', { desc = 'Initialize Molten', silent = true })

      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 20

      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true

      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true

      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = false

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MoltenInitPost',
        callback = function()
          -- quarto code runner mappings
          local r = require 'quarto.runner'
          vim.keymap.set('n', '<localleader>rc', r.run_cell, { desc = 'run cell', silent = true })
          vim.keymap.set('n', '<localleader>ra', r.run_above, { desc = 'run cell and above', silent = true })
          vim.keymap.set('n', '<localleader>rb', r.run_below, { desc = 'run cell and below', silent = true })
          vim.keymap.set('n', '<localleader>rl', r.run_line, { desc = 'run line', silent = true })
          vim.keymap.set('n', '<localleader>rA', r.run_all, { desc = 'run all cells', silent = true })
          vim.keymap.set('n', '<localleader>RA', function()
            r.run_all(true)
          end, { desc = 'run all cells of all languages', silent = true })

          -- setup some molten specific keybindings
          vim.keymap.set(
            'n',
            '<localleader>me',
            ':MoltenEvaluateOperator<CR>',
            { desc = 'evaluate operator', silent = true }
          )
          vim.keymap.set('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { desc = 're-eval cell', silent = true })
          -- vim.keymap.set(
          --   'v',
          --   '<localleader>r',
          --   ':<C-u>MoltenEvaluateVisual<CR>gv',
          --   { desc = 'execute visual selection', silent = true }
          -- )
          vim.keymap.set(
            'n',
            '<localleader>os',
            ':noautocmd MoltenEnterOutput<CR>',
            { desc = 'open output window', silent = true }
          )
          vim.keymap.set(
            'n',
            '<localleader>oh',
            ':MoltenHideOutput<CR>',
            { desc = 'close output window', silent = true }
          )
          vim.keymap.set('n', '<localleader>md', ':MoltenDelete<CR>', { desc = 'delete Molten cell', silent = true })
          local open = false
          vim.keymap.set('n', '<localleader>ot', function()
            open = not open
            vim.fn.MoltenUpdateOption('auto_open_output', open)
          end)
          vim.keymap.set(
            'n',
            '<localleader>mx',
            ':MoltenOpenInBrowser<CR>',
            { desc = 'open output in browser', silent = true }
          )
        end,
      })

      -- -- automatically import output chunks from a jupyter notebook
      -- -- tries to find a kernel that matches the kernel in the jupyter notebook
      -- -- falls back to a kernel that matches the name of the active venv (if any)
      -- local imb = function(e) -- init molten buffer
      --   vim.schedule(function()
      --     local kernels = vim.fn.MoltenAvailableKernels()
      --     local try_kernel_name = function()
      --       local metadata = vim.json.decode(io.open(e.file, 'r'):read 'a')['metadata']
      --       return metadata.kernelspec.name
      --     end
      --     local ok, kernel_name = pcall(try_kernel_name)
      --     if not ok or not vim.tbl_contains(kernels, kernel_name) then
      --       kernel_name = nil
      --       local venv = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX'
      --       if venv ~= nil then
      --         kernel_name = string.match(venv, '/.+/(.+)')
      --       end
      --     end
      --     if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
      --       vim.cmd(('MoltenInit %s'):format(kernel_name))
      --     end
      --     vim.cmd 'MoltenImportOutput'
      --   end)
      -- end
      --
      -- -- automatically import output chunks from a jupyter notebook
      -- vim.api.nvim_create_autocmd('BufAdd', {
      --   pattern = { '*.ipynb' },
      --   callback = imb,
      -- })
      --
      -- -- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
      -- vim.api.nvim_create_autocmd('BufEnter', {
      --   pattern = { '*.ipynb' },
      --   callback = function(e)
      --     if vim.api.nvim_get_vvar 'vim_did_enter' ~= 1 then
      --       imb(e)
      --     end
      --   end,
      -- })
      --
      -- -- automatically export output chunks to a jupyter notebook on write
      -- vim.api.nvim_create_autocmd('BufWritePost', {
      --   pattern = { '*.ipynb' },
      --   callback = function()
      --     if require('molten.status').initialized() == 'Molten' then
      --       vim.cmd 'MoltenExportOutput!'
      --     end
      --   end,
      -- })
    end,
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    '3rd/image.nvim',
    opts = {
      backend = 'kitty', -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
    },
  },
  {
    'GCBallesteros/jupytext.nvim',
    -- ft = { "ipynb" },
    -- enabled = false,
    opts = {
      style = 'markdown',
      output_extension = 'md',
      force_ft = 'markdown',
    },
    -- config = function()
    --   require('jupytext').setup {
    --     style = 'markdown',
    --     output_extension = 'md',
    --     force_ft = 'markdown',
    --   }
    -- end,
  },
  --   {
  --     'jmbuhr/otter.nvim',
  --     enabled = false,
  --     ft = { 'markdown', 'quarto' },
  --   },
  {
    'quarto-dev/quarto-nvim',
    -- enabled = false,
    dependencies = {
      'nvim-lspconfig',
      'otter.nvim',
    },
    config = function()
      local quarto = require 'quarto'
      quarto.setup {
        lspFeatures = {
          languages = { 'python' },
          chunks = 'all', -- 'curly' or 'all'
          diagnostics = {
            enabled = true,
            triggers = { 'BufWritePost' },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          hover = 'K',
          definition = 'gd',
          rename = '<leader>rn',
          references = 'gr',
          format = '<leader>gf',
        },
        codeRunner = {
          enabled = true,
          ft_runners = {
            bash = 'slime',
          },
          default_method = 'molten',
        },
      }

      -- vim.keymap.set(
      --   'n',
      --   '<localleader>qp',
      --   quarto.quartoPreview,
      --   { desc = 'Preview the Quarto document', silent = true, noremap = true }
      -- )
      -- -- to create a cell in insert mode, I have the ` snippet
      -- vim.keymap.set('n', '<localleader>cc', 'i`<c-j>', { desc = 'Create a new code cell', silent = true })
      -- vim.keymap.set(
      --   'n',
      --   '<localleader>cs',
      --   'i```\r\r```{}<left>',
      --   { desc = 'Split code cell', silent = true, noremap = true }
      -- )
    end,
  },
  --   -- {
  --   --   'quarto-dev/quarto-nvim',
  --   --   enabled = false,
  --   --   dependencies = {
  --   --     'jmbuhr/otter.nvim',
  --   --     -- 'nvim-treesitter/nvim-treesitter',
  --   --     'nvim-lspconfig',
  --   --   },
  --   --   ft = { 'markdown', 'quarto' },
  --   --   config = function()
  --   --     require('quarto').setup {
  --   --       -- default options
  --   --       -- these are examples, not defaults. Please see the readme
  --   --       lspFeatures = {
  --   --         languages = { 'r', 'python' },
  --   --         chunks = 'all',
  --   --         diagnostics = {
  --   --           enabled = true,
  --   --           triggers = { 'BufWritePost' },
  --   --         },
  --   --         completion = {
  --   --           enabled = true,
  --   --         },
  --   --       },
  --   --       keymap = {
  --   --         hover = 'K',
  --   --         definition = 'gd',
  --   --         rename = '<leader>rn',
  --   --         references = 'gr',
  --   --         format = '<leader>gf',
  --   --       },
  --   --       codeRunner = {
  --   --         enabled = true,
  --   --         default_method = 'molten',
  --   --       },
  --   --     }
  --   --   end,
  --   -- },
  --   -- {
  --   --   'jmbuhr/otter.nvim',
  --   --   -- opts = {
  --   --   --   buffers = { set_filetype = true },
  --   --   -- },
  --   --   ft = { 'markdown', 'quarto' },
  --   -- },
  --   -- { -- directly open ipynb files as quarto docuements
  --   --   -- and convert back behind the scenes
  --   --   'GCBallesteros/jupytext.nvim',
  --   --   -- config = true,
  --   --   opts = {
  --   --     style = 'markdown',
  --   --     output_extension = 'md',
  --   --     force_ft = 'markdown',
  --   --   },
  --   -- },
}
