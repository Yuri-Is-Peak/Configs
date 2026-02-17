return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require("nvim-tree.api")

    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
      on_attach = function(bufnr)
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- <leader>q closes the tree when focused
        vim.keymap.set("n", "<leader>q", function()
          api.tree.close()
        end, {
          buffer = bufnr,
          desc = "Close NvimTree",
        })
      end,
    })

    -- Global toggle
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
  end,
}

