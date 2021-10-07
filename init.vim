let settings_file = expand(stdpath("config") . "/settings.json")
" let sourvim_settings = {}
if filereadable(settings_file)
	let sourvim_settings = json_decode(readfile(settings_file))
endif

" Setup ginit.vim for Nvim-QT
if ! filereadable(expand(stdpath("config") . "/ginit.vim"))
	call writefile(["GuiFont! FiraCode NF"], stdpath("config") . "/ginit.vim", "a")
endif
" Download VimPlug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugs')
Plug 'airblade/vim-gitgutter'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'irishgreencitrus/PMLO-vim-syntax'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ms-jpq/chadtree'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ollykel/v-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sbdchd/neoformat'
Plug 'stefanos82/nelua.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
call plug#end()

let g:dashboard_custom_header = [
			\' ##########  ##########  ###   ##### ########## ####   #### ####  #####    #####',
			\' ####  ####  ####  ##### ###   ##### ###   #### ####   #### ####  #####   ######',
			\' ####        ####  ##### ###   ##### ###  ##### ####   #### ####  ###### #######',
			\' ####        ####  ##### ###   ##### #########  ####   #### ####  ##############',
			\' #####       ####  ##### ###   ##### #########  ####   #### ####  ##############',
			\'    #####    ####  ##### ###   ##### ###  ##### ####   #### ####  #### #### ####',
			\'       ####  ####  ##### ###   ##### ###   #### ####   #### ####  ####  ##  ####',
			\' ###   ####  ####  ##### ####  ##### ###   #### ####  ##### ####  ####  #   ####',
			\' ##########   #########  #########   ###   ###  #### ###### ###    ###      ### ',
			\' ########       ####        ###                 ########                        ',
			\' ######                                         ######                          ',
			\' ###                                            ###                             ',
			\]
let g:dashboard_custom_section = {
			\'a': {'description':[' Find File'],'command':'DashboardFindFile'},
			\'b': {'description':[' Change Colourscheme'],'command':'DashboardChangeColorscheme'},
			\'c': {'description':[' Recently Edited'],'command':'DashboardFindHistory'},
			\'d': {'description':[' Find Word'],'command':'DashboardFindWord'},
			\'e': {'description':[' Create New'],'command':'DashboardNewFile'},
			\}
let g:dashboard_default_executive = 'fzf'
let g:lightline = {'colorscheme': 'onedark', 'separator': {'left':'','right':''},'subseparator': { 'left': '', 'right': '' }, 'enable':{'tabline':0}}
let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:rainbow_active = 1

let g:session_autosave = 'no'

nnoremap <silent><Tab>   :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>

" Colourscheme
exec "colorscheme onedark"
set tabstop=4

" Settings CHANGEME
set mouse=a
set noshowmode
set nowrap
set number
set relativenumber

set termguicolors


set nocompatible
set hidden
set encoding=utf-8
set showtabline=1
" Comment this out to change mode
set bg=dark

" Comment this out to hide tildas		
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

set completeopt=menuone,noselect
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.gdscript.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.clojure_lsp.setup{}
require'telescope'.load_extension('project')

require'bufferline'.setup{
options = {
		always_show_bufferline = false,
	}
}

require'compe'.setup{
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;
	source = {
		path = true;
		nvim_lsp = true;
	};
}
local t = function(str)
	return vim.api.nvim_replace_termcodes(str,true,true,true)
end
local check_back_space = function()
	local col = vim.fn.col('.') - 1
	if col == 0 or vim.fn.getline('.'):sub(col,col):match("%s") then
		return true
	else
		return false
	end
end
-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

EOF


