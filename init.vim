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
Plug 'hrsh7th/nvim-compe'
Plug 'airblade/vim-gitgutter'
Plug 'glepnir/dashboard-nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sbdchd/neoformat'
Plug 'itchyny/lightline.vim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
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
let g:lightline = {'colorscheme': sourvim_settings["lightline-colourscheme"], 'separator': {'left':'','right':''},'subseparator': { 'left': '', 'right': '' }, 'enable':{'tabline':0}}
let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
if sourvim_settings["enable-rainbow-brackets"]
	let g:rainbow_active = 1
else
	let g:rainbow_active = 0
endif
let g:session_autosave = 'no'

nnoremap <silent><Tab>   :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>

" Colourscheme
exec "colorscheme ".sourvim_settings["colourscheme"]
set tabstop=4

" Settings
if sourvim_settings["mouse-support"]
	set mouse=a
endif
if ! sourvim_settings["show-mode"]
	set noshowmode
endif
if ! sourvim_settings["line-wrapping"]
	set nowrap
endif
if sourvim_settings["ruler"]
	set number
endif
if sourvim_settings["relative-ruler"]
	set relativenumber
endif
if sourvim_settings["truecolour-terminal"]
	set termguicolors
endif
set nocompatible
set showtabline=1
if sourvim_settings["darkmode"]
	set bg=dark
endif

if sourvim_settings["nerdtree"]["exit-on-last"]
	" Exit Vim if NERDTree is the only window left.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
endif
if sourvim_settings["nerdtree"]["refuse-buffer-replace"]
	" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
	autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
endif
if sourvim_settings["nerdtree"]["auto-open-on-tabs"]
	" Open the existing NERDTree on each new tab.
	autocmd BufWinEnter * silent NERDTreeMirror
endif
if sourvim_settings["hide-tildas"]
	hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
endif

set completeopt=menuone,noselect
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.gdscript.setup{}
require'lspconfig'.gopls.setup{}

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


