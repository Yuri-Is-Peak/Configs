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
		initial_mode = "normal",
        },
      }

      -- your keymaps
      -- Search files in current file's directory only
	vim.keymap.set('n', '<leader>of', function()
  		builtin.find_files({
    			cwd = vim.fn.expand('%:p:h')  -- current file's directory
  		})
	end, { desc = "Find files in current directory" })
      vim.keymap.set('n', '<C-o>',  builtin.git_files,  {})
      vim.keymap.set('n', '<leader>os', function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") })
	      end) 
    end
  }
}

