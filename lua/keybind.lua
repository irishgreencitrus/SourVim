local bind = vim.api.nvim_set_keymap
bind("n", "<Tab>",":BufferLineCycleNext<CR>", {noremap = true, silent = true})
bind("n", "<S-Tab>",":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
bind("n", "tt",":CHADopen<CR>", {noremap = true, silent = true})
bind("n", "tv", ":ToggleTerm direction=vertical size=60<CR>",{noremap=true,silent=true})
bind("n", "th", ":ToggleTerm direction=horizontal size=10<CR>",{noremap=true,silent=true})
bind("n", "tj", ":ToggleTerm direction=float<CR>",{noremap=true,silent=true})
bind("n", "<A-j>", ":m .+1<CR>==",{noremap=true,silent=true})
bind("n", "<A-k>", ":m .-2<CR>==",{noremap=true,silent=true})

