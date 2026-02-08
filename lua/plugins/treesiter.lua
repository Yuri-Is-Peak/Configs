return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  priority = 100,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
  },
  opts = {
    ensure_installed = {
      "lua", "vim", "vimdoc", "query",
      "python", "javascript", "typescript",
      "html", "css", "json",
      "bash", "markdown", "regex",
    },
    auto_install = true,
    
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    
    indent = { enable = true },
    
    autotag = { enable = true },
    
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer" },
        goto_previous_start = { ["[f"] = "@function.outer" },
      },
    },
  },
  
  config = function(_, opts)
    require('nvim-treesitter.config').setup(opts)  -- Changed from 'configs' to 'config'
  end,
}
