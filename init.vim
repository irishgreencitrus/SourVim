let g:SOURdir = expand(stdpath("config"))
let g:SOURdir_data = expand(stdpath("data"))
let g:SOURconfig_file = expand(stdpath("config") . "/init.vim")
let g:SOURgui_config_file = expand(stdpath("config") . "/ginit.vim")


function! SourUpdate()
		execute '!git -C '.g:SOURdir.' pull'
		execute 'PlugUpgrade'
		execute 'PlugUpdate'
endfunction
function! SourConfig()
		execute 'e '.g:SOURconfig_file
endfunction
command SOURupdate call SourUpdate()
command SOURconfigure call SourConfig()

" Setup ginit.vim for Nvim-QT
if !filereadable(g:SOURgui_config_file)
	call writefile(["GuiFont! JetBrainMono NF"], g:SOURgui_config_file, "a")
endif

" Download VimPlug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(g:SOURdir_data.'/plugs')
Plug 'williamboman/nvim-lsp-installer'
Plug 'udalov/kotlin-vim'
Plug 'airblade/vim-gitgutter'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'glepnir/dashboard-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'irishgreencitrus/PMLO-vim-syntax'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/which-key.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim', { 'on': ['EmmetInstall','Emmet'] }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ms-jpq/chadtree', {'branch': 'chad'}
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
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

let g:dashboard_custom_header = [
			\'                 										  @@@@                ',
			\'                                                                               ',
			\'########+-  -*#######+  ###=  *### :*#######*: ###+  :###- ####  ###+     +###*',
			\'@@@@@@@@@@= @@@@@@@@@@* @@@*  @@@@ #@@@@@@@@@@ @@@%  =@@@+ @@@@ @@@@@=   *@@@@@',
			\'@@@%--*###- @@@@--#@@@* @@@*  @@@@ #@@@=.=@@@@ @@@#  =@@@= @@@@ %@@@@@- #@@@@@%',
			\'@@@#        @@@%  *@@@* @@@*  @@@@ #@@@--#@@@@ @@@%  =@@@+ @@@@ %@@@@@@#@@@@@@@',
			\'@@@#        @@@%  *@@@* @@@*  @@@@ #@@@@@@@@+: @@@%  =@@@+ @@@@ %@@@@@@@@@@@@@@',
			\'%@@@%+:     @@@%  *@@@* @@@*  @@@@ #@@@@@@@@*- @@@%  =@@@+ @@@@ %@@@@@@@@@@@@@@',
			\' :=#@@@@#=. @@@%  *@@@* @@@*  @@@@ #@@@=-#@@@@ @@@%  =@@@+ @@@@ %@@@=#@@@*+@@@@',
			\'..   :%@@@= @@@%  *@@@* @@@*  @@@@ #@@@: :@@@@ @@@%  -@@@+ @@@@ %@@@- %@% =@@@@',
			\'@@@#.=@@@@= @@@@%=#@@@* @@@@#-%@@@ %@@@- -@@@@ @@@# -#@@@+ @@@@ @@@@= .%: +@@@@',
			\'@@@@@@@@@@- *@@@@@@@%+. #@@@@@@@#= -#@@- -@@#= @@@@@@@@@@- @@#= -*@@=     +@@*:',
			\'@@@@@@@%=.    -#@@*-     .=%@%+:     .+: :=.   @@@@@@@%=.  =.      =:     --   ',
			\'@@@@@*:                                        @@@@@*:                         ',
			\'@@%=.                                          @@%=.                           ',
			\'*:                                             *:                              ',
			\]
let g:dashboard_custom_section = {
			\'a': {'description':[' Find File'],'command':'DashboardFindFile'},
			\'b': {'description':[' Change Colourscheme'],'command':'DashboardChangeColorscheme'},
			\'c': {'description':[' Recently Edited'],'command':'DashboardFindHistory'},
			\'d': {'description':[' Find Word'],'command':'DashboardFindWord'},
			\'e': {'description':[' Create New'],'command':'DashboardNewFile'},
			\}
let g:dashboard_default_executive = 'fzf'
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ 'separator': {'left':'','right':''},
	\ 'subseparator': { 'left': '', 'right': '' }, 
	\ 'enable':{'tabline':0}}
let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:rainbow_active = 1
let g:nvim_tree_show_icons = {'git':0}
let g:nvim_tree_gitignore = 0
let g:nvim_tree_git_hl = 0
let g:chadtree_settings = {"view.width":30}

let g:session_autosave = 'no'

nnoremap <silent><Tab>   :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent>tt :CHADopen<CR>

" Colourscheme
exec "colorscheme onedark"
set bg=dark
set completeopt=menu,menuone,noselect
set encoding=utf-8
set hidden
set mouse=a
set nocompatible
set noshowmode
set nowrap
set number
set relativenumber
set showtabline=1
set tabstop=4
set shiftwidth=4
set termguicolors

" Comment this out to hide tildas		
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

lua << EOF
require'lspconfig'.gdscript.setup{}
require'telescope'.load_extension('project')
require'which-key'.setup{}
require'toggleterm'.setup{
	open_mapping = [[tj]],
	direction = 'float',
}
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
lsp_installer.on_server_ready(function (server) server:setup {} end)

require'bufferline'.setup{
options = {
		always_show_bufferline = false,
	}
}
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require'luasnip'
local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
	 luasnip.lsp_expand(args.body)
  end,
},
mapping = {
	['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	['<C-y>'] = cmp.config.disable, 
	['<C-e>'] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	["<Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.select_next_item()
	  elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	  elseif has_words_before() then
		cmp.complete()
	  else
		fallback()
	  end
	end, { "i", "s" }),

	["<S-Tab>"] = cmp.mapping(function(fallback)
	  if cmp.visible() then
		cmp.select_prev_item()
	  elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	  else
		fallback()
	  end
	end, { "i", "s" }),
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' }, 
}, {
  { name = 'buffer' },
})
})



-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
	  { name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources(
	{
	  { name = 'path' }
	},
	{
	  { name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['gdscript'].setup {
	capabilities = capabilities
}
EOF
