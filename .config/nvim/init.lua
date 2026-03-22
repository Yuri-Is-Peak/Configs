vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
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


vim.api.nvim_set_hl(0, "LineNrAbove",     { fg = "#54346e" })
vim.api.nvim_set_hl(0, "LineNrBelow",     { fg = "#54346e" })

-- kills the highligt for current line
vim.api.nvim_set_hl(0, "CursorLine", { bg = NONE })
vim.diagnostic.open_float()
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { silent = true })

-- not used
vim.api.nvim_set_hl(0, "@function",      { fg = "#a582c2" })  -- function definitions
vim.api.nvim_set_hl(0, "@function.call", { fg = "#a582c2" })  -- function calls
vim.api.nvim_set_hl(0, "@method",        { fg = "#a582c2" })  -- method definitions
vim.api.nvim_set_hl(0, "@method.call",   { fg = "#a582c2" })  -- method calls

-- used
vim.api.nvim_set_hl(0, "@function",      { fg = "#7574b8" })  -- function definitions
vim.api.nvim_set_hl(0, "@function.call", { fg = "#7574b8" })  -- function calls
vim.api.nvim_set_hl(0, "@method",        { fg = "#7574b8" })  -- method definitions
vim.api.nvim_set_hl(0, "@method.call",   { fg = "#7574b8" })  -- method calls


vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#f700ff", bold = true })     -- bright current line number

vim.api.nvim_set_hl(0, "Comment",      { fg = "#8a8686", italic = true })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#a161cf", bold = false })

-- Cursor shapes per mode
vim.opt.guicursor = {
  "n-v-c:block-Cursor",           -- Normal, Visual, Command: block
  "i-ci-ve:ver45-CursorInsert",   -- Insert: vertical bar (45%)
  "r-cr:hor30-CursorReplace",     -- Replace: horizontal bar (30%)
}


vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })


-- Cursor highlight groups
vim.api.nvim_set_hl(0, "Cursor", {
  fg = "#1e1e2e",
  bg = "#ee45f7",
})

vim.api.nvim_set_hl(0, "CursorInsert", {
  fg = "#1e1e2e",
  bg = "#f00c49",
})

vim.api.nvim_set_hl(0, "CursorReplace", {
  fg = "#1e1e2e",
  bg = "#0fff0f",
})


vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- Abreviations
vim.cmd('ab ch char')
