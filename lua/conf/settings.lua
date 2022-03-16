local set = vim.opt
local setg = vim.g

-- colorscheme
vim.cmd "colorscheme onedark"
-- hide tildas
vim.cmd "hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg"

set.bg = "dark"
set.compatible = false
set.completeopt = {"menu","menuone","noselect"}
set.cursorline = true
set.cursorline.cursorlineopt = "number"
set.encoding = "utf-8"
set.hidden = true
set.mouse = "a"
set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.showmode = false
set.showtabline = 1
set.tabstop = 4
set.termguicolors = true
set.wrap = false
set.expandtab = false
setg.rainbow_active = 1
setg.chadtree_settings = {view = { width = 30 }}
