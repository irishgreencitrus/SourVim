local keymap = vim.api.nvim_set_keymap

keymap("n","<Tab>",":BufferLineCycleNext<CR>", {noremap = true, silent = true})
keymap("n","<S-Tab>",":BufferLineCyclePrev<CR>", {noremap = true,silent=true})
keymap("n","tt",":CHADopen<CR>", {noremap = true,silent=true})
keymap("n","tv",":ToggleTerm direction=vertical size=60<CR>",{noremap=true,silent=true})
keymap("n","th",":ToggleTerm direction=horizontal size=10<CR>",{noremap=true,silent=true})
keymap("n","tj",":ToggleTerm direction=float<CR>",{noremap=true,silent=true})
