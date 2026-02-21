return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require("nvim-tree.api")

    require("nvim-tree").setup({
      -- IMPORTANT: keep netrw behavior
      disable_netrw = false,
      hijack_netrw = false,

      hijack_directories = {
        enable = false,
        auto_open = false,
      },

      update_focused_file = {
        enable = false,
      },

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

      actions = {
        open_file = {
          quit_on_open = false,
        },
      },

      on_attach = function(bufnr)
        api.config.mappings.default_on_attach(bufnr)

        -- <leader>q closes tree ONLY when focused
        vim.keymap.set("n", "<leader>q", function()
          api.tree.close()
        end, { buffer = bufnr, desc = "Close NvimTree" })
      end,
    })

    -- Only open when you press this
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })
  end,
}

