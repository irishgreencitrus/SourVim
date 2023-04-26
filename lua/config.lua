vim.g.coq_settings = { auto_start = "shut-up" }
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.diagnostic.config { virtual_text = false }

local set = vim.opt
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.guifont = "Hurmit NF:h12"

set.termguicolors = true
set.number = true
set.relativenumber = true
set.compatible = false
set.wrap = false
set.cursorline = true
set.mouse = "a"

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
