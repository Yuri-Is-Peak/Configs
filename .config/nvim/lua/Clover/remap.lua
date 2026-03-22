vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>")
vim.keymap.set("i", "<C-h>", "<Left>"  )
vim.keymap.set("i", "<C-j>", "<Down>"  )
vim.keymap.set("i", "<C-k>", "<Up>"    )
vim.keymap.set("i", "<C-l>", "<Right>" )
vim.api.nvim_create_user_command("RecentT", "Telescope oldfiles", {})
vim.keymap.set("n", "<leader>pr", vim.cmd.RecentT)

-- Make kitty opacity higher for nvim usage
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.fn.jobstart({"kitty", "@", "set-background-opacity", "0.9"})
  end,
})

