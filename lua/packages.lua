local configure_packages = {
	lsp = true,
	show_indent = true,
}


require "paq" {
	"savq/paq-nvim";
	"marko-cerovac/material.nvim";
	"echasnovski/mini.nvim";
	"sheerun/vim-polyglot";
	"TimUntersberger/neogit";
	"nvim-lua/plenary.nvim";
	"lewis6991/gitsigns.nvim";
	"kyazdani42/nvim-web-devicons";
	"nvim-lualine/lualine.nvim";
	"akinsho/bufferline.nvim";
	"mhinz/vim-startify";
	"tommcdo/vim-lion";
	"rajasegar/vim-astro";
	{"ms-jpq/chadtree", branch="chad", run="python3 -m chadtree deps"};
	"neovim/nvim-lspconfig";
	"williamboman/nvim-lsp-installer";
	{"ms-jpq/coq_nvim", branch="coq",run = "python3 -m coq deps"};
	{"ms-jpq/coq.artifacts", branch="artifacts"};
	{"ms-jpq/coq.thirdparty", branch="3p"};
	{"mg979/vim-visual-multi", branch = "master"};
	"sbdchd/neoformat";
	"luochen1990/rainbow";
	"akinsho/toggleterm.nvim";
	"rktjmp/lush.nvim";
	"casonadams/walh";
}
vim.g.coq_settings = { auto_start = 'shut-up' }

if configure_packages["lsp"] then
	local coq = require "coq"
	local lsp_installer = require("nvim-lsp-installer")
	lsp_installer.on_server_ready(function(server)
		server:setup(coq.lsp_ensure_capabilities({}))
	end)
end

require("neogit").setup {}
require("mini.pairs").setup {}
require("mini.sessions").setup {}
require("mini.surround").setup {}
require("mini.comment").setup {}
if configure_packages["show_indent"] then
	require("mini.indentscope").setup {
		draw = {
			delay = 0,
			animation = nil,
		}
	}
end
require("gitsigns").setup {}
require("lualine").setup {}
require('bufferline').setup {}
