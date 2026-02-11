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

