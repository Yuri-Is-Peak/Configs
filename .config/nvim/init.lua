vim.opt.clipboard = "unnamedplus"
vim.o.timeout = true
vim.o.timeoutlen = 500
require("config.lazy")
require("Clover")
require("Clover.set")
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight NormalNC guibg=none
  highlight EndOfBuffer guibg=none
]])


-- Cursor shapes per mode
vim.opt.guicursor = {
  "n-v-c:block-Cursor",           -- Normal, Visual, Command: block
  "i-ci-ve:ver45-CursorInsert",   -- Insert: vertical bar (45%)
  "r-cr:hor30-CursorReplace",     -- Replace: horizontal bar (30%)
}

-- Cursor highlight groups
vim.api.nvim_set_hl(0, "Cursor", {
  fg = "#1e1e2e",
  bg = "#421D7D",
})

vim.api.nvim_set_hl(0, "CursorInsert", {
  fg = "#1e1e2e",
  bg = "#ff295e",
})

vim.api.nvim_set_hl(0, "CursorReplace", {
  fg = "#1e1e2e",
  bg = "#ff295e",
})

