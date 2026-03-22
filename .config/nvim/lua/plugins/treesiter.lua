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
      "c",  -- add c here too!
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
    -- ... rest of your opts
  },
  -- remove the config function entirely
}
