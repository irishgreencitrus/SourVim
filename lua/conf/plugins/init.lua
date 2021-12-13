local set = vim.opt

require("lualine").setup{}
require("which-key").setup{}
require("telescope").load_extension('project')

require("bufferline").setup{
  options = {
    always_show_bufferline = false
  }
}

require("toggleterm").setup{
  insert_mappings = false,
  persist_size = false,
  start_in_insert = false,
  float_opts = {
    border = "curved",
  },
}

set.list = true
set.listchars:append("space:⋅")
set.listchars:append("eol:↴")
require("indent_blankline").setup {
  char = "▏",
  buftype_exclude = {"terminal"},
  filetype_exclude = {"dashboard"},
  show_end_of_line = true,
}

