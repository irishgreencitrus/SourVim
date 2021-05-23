" Setup ginit.vim for Nvim-QT
if ! filereadable(expand("./ginit.vim"))
	call writefile(["GuiFont FiraCode NF"], stdpath("config") . "/ginit.vim", "a")
endif
" Download VimPlug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugs')
Plug 'clktmr/vim-gdscript3'
Plug 'glepnir/dashboard-nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', {'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
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
let g:lightline = {'colorscheme':'onedark', 'separator': {'left':'','right':''},'subseparator': { 'left': '', 'right': '' }}
let g:onedark_hide_endofbuffer = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:rainbow_active = 1
let g:session_autosave = 'no'

" Colourscheme
colorscheme onedark

" Settings
set mouse=a
set noshowmode
set number
set relativenumber
set termguicolors

"COC Keybinds
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent><S-Tab> :tabNext <CR>
nnoremap <silent><Tab> :tabnext <CR>

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

