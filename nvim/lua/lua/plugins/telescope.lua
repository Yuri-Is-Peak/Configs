return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')

      telescope.setup{
        defaults = {
          -- you can put other defaults here if needed
        },
      }

      -- your keymaps
      vim.keymap.set('n', '<leader>of', builtin.find_files, {})
      vim.keymap.set('n', '<C-o>',  builtin.git_files,  {})
      vim.keymap.set('n', '<leader>os', function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") })
	      end) 
    end
  }
}

