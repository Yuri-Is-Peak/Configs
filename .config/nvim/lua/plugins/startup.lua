
return {
  "startup-nvim/startup.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    -- 1. Seed random generator immediately
    math.randomseed(os.time())

    -- 2. Define Fallback colors (Original)
    local colors = {
      "#211d38", "#2e2a4f", "#3b405e", "#60556e",
      "#9a6278", "#c7786f", "#cfa98a", "#cdd4a5"
    }

    -- 3. Try to load external palettes
    -- "Clover.pallete" maps to ~/.config/nvim/lua/Clover/pallete.lua
    local status, palettes = pcall(require, "Clover.pallete")

    if status and type(palettes) == "table" and #palettes > 0 then
        -- Pick a random palette from the loaded file
        colors = palettes[math.random(#palettes)]
    else
        -- Optional: Print error to :messages if file isn't found
        -- vim.notify("Could not load lua/Clover/pallete.lua, using default.", vim.log.levels.WARN)
    end

    -- 4. Create highlight groups using the selected colors
    for i, color in ipairs(colors) do
      vim.api.nvim_set_hl(0, "StartupHeader" .. i, { fg = color, bold = true })
    end

    local header_lines = {
      [[                                                                               ]],
      [[   ████╗╗    ███╗╗███╗╗    ███╗╗███╗█████╗     ████╗╗]],
      [[   ██████╗   ███║║███║║    ███║║███║██████╗╗ ██████║║]],
      [[   ██████╗   ███║║███║║    ███║║███║██████╗╗ ██████║║]],
      [[   ███╔███╗╗ ███║║███║║    ███║║███║███╔╔██████╔███║║]],
      [[   ███║╚╚███╗███║║╚╚███╗  ███╔╝╝███║███║║╚███╔╔╝███║║]],
      [[   ███║╚╚███╗███║║╚╚███╗  ███╔╝╝███║███║║╚███╔╔╝███║║]],
      [[   ███║  ╚██████║║  ╚██████╔╔╝  ███║███║║ ╚╚═╝╝ ███║║]],
      [[   ╚══╝   ╚╚════╝╝   ╚╚════╝╝   ╚══╝╚╚═╝╝       ╚╚═╝╝]],
    }

    require("startup").setup({
      header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = header_lines,
        highlight = "StartupHeader1",
        default_color = "",
        oldfiles_amount = 0,
      },
      body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
          { "󰈞 New file", "enew", "e" },
          { "󰈞 Find file", "Telescope find_files", "f" },
          { "󰈞 Recent files", "Telescope oldfiles", "r" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
      },
      recent_files = {
        type = "oldfiles",
        oldfiles_directory = false,
        align = "left",
        fold_section = false,
        title = "Recent Files",
        margin = 2,
        content = "",
        highlight = "String",
        default_color = "",
        oldfiles_amount = 3,
      },

      -- Replaced the cowsay/quotes section with an editable empty text section.
      -- Put your custom lines into `content` below.
      custom_text = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Notes",
        margin = 1,
        content = {
		""
          -- Add your text lines here. Example:
          -- "Line 1: Welcome to Neovim",
          -- "Line 2: Edit this file to change the message"
        },
        highlight = "Comment",
        default_color = "",
        oldfiles_amount = 0,
      },

      options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        -- paddings order corresponds to recent_files, header, body, custom_text
        paddings = { 0, 0, 2, 2, 0 },
        after = function()
          vim.schedule(function()
            local buf = vim.api.nvim_get_current_buf()
            if vim.bo[buf].filetype == "startup" then
              local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

              -- Apply gradient to header
              for line_num, line in ipairs(lines) do
                if line:match("   ████╗╗    ███╗╗███╗╗    ███╗╗███╗█████╗     ████╗╗") then
                  for i = 0, 7 do
                    if lines[line_num + i] then
                      vim.api.nvim_buf_add_highlight(
                        buf,
                        -1,
                        "StartupHeader" .. (i + 1),
                        line_num - 1 + i,
                        0,
                        -1
                      )
                    end
                  end
                  break
                end
              end

              -- Enter command mode on startup
              vim.cmd("startinsert")
              vim.cmd("stopinsert")
              vim.api.nvim_feedkeys(":", "n", false)
            end
          end)
        end,
      },
      mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
      },
      colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
      },
      parts = { "recent_files", "header", "body", "custom_text" },
    })
  end,
}
