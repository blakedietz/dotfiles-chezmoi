-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Show all whitespace
vim.opt.list = true
vim.opt.listchars = {
  eol = "¬",
  nbsp = "↲",
  space = "·",
  tab = "» ",
}

if vim.g.neovide then
  vim.o.guifont = "BerkeleyMono Nerd Font:h20"
  vim.g.neovide_cursor_vfx_mode = "railgun"

  -- Support pasting from system clipboard in neovide
  -- https://github.com/neovide/neovide/issues/113
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- By default LazyVim does some intelligent guessing as to whether or not a directory should be
-- treated as a project root. For example, in phoenix projects when opening a file from the `/assets`
-- directory, the `tailwind.config.js` file cues LazyVim in that it's a js project root. LazyVim then teats
-- `/assets` as the project root. This means using opening telescope or neo-tree only files
-- inside of `/assets` are visible.
--
-- The following configurations disables this behavior.
-- Discussion: https://github.com/LazyVim/LazyVim/discussions/1770#discussioncomment-7304728
vim.g.root_spec = { "cwd" }
