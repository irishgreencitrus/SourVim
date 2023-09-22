local LOADED_LSP_SERVERS = {
    "clangd", "arduino_language_server", "rust_analyzer", "lua_ls",
    "pyright", "zls", "kotlin_language_server"
}

return {
    { "wakatime/vim-wakatime" },
    {
        "marko-cerovac/material.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("material").setup {
                plugins = {
                    "gitsigns", "mini", "nvim-tree", "nvim-web-devicons",
                    "telescope", "which-key"
                }
            }
            vim.cmd "colorscheme material"
            vim.g.material_style = "deep ocean"
        end
    }, {
    "ray-x/navigator.lua",
    dependencies = {
        { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
        "neovim/nvim-lspconfig", "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("navigator").setup {
            mason = true,
            lsp = {
                format_on_save = false,
                diagnostic = { virtual_text = false }
            }
        }
    end
}, { "nvim-treesitter",   build = ":TSUpdate" }, {
    "nvim-treesitter/nvim-treesitter-refactor",
    config = function()
        require("nvim-treesitter.configs").setup {
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            refactor = {
                highlight_definititions = {
                    enable = true,
                    clear_on_cursor_move = true
                },
                -- highlight_current_scope = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = { smart_rename = "grr" }
                }
            }
        }
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" }
}, {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require("treesitter-context").setup {
            enable = true,
            max_lines = 3,
            trim_scope = "outer",
            min_window_height = 20
        }
    end
}, {
    "ms-jpq/coq_nvim",
    branch = "coq",
    dependencies = {
        { "ms-jpq/coq.artifacts",  branch = "artifacts" },
        { "ms-jpq/coq.thirdparty", branch = "3p" }, "neovim/nvim-lspconfig"
    },
    config = function()
        local lspconfig = require("lspconfig")
        local coq = require("coq")
        for _, lsp in ipairs(LOADED_LSP_SERVERS) do
            lspconfig[lsp].setup {
                coq.lsp_ensure_capabilities {
                    on_attach = function(client)
                        client.server_capabilities_document_formatting =
                            false
                    end
                }
            }
        end
    end
}, { "neovim/nvim-lspconfig" }, {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup {
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "",
                    package_uninstalled = ""
                }
            }
        }
    end
}, {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup { automatic_installation = false }
    end,
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" }
}, {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function() require("lsp_lines").setup() end
}, {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup {
            sources = {
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.rustfmt
                    .with({ extra_args = { '--edition=2021' } }),
                null_ls.builtins.completion.tags
            },
            on_attach = function(client, bufnr)
                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end
                    })
                end
            end
        }
    end
}, {
    'notjedi/nvim-rooter.lua',
    config = function() require 'nvim-rooter'.setup() end
}, {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        require("which-key").setup {}
    end
}, {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup {
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = false
            },
            renderer = { group_empty = true },
            update_focused_file = { enable = true, update_root = true },
            view = { width = 20 }
        }
    end
}, {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.comment").setup()
        require("mini.pairs").setup()
        local starter = require("mini.starter")
        starter.setup {
            autoopen = true,
            evaluate_single = true,
            items = {
                starter.sections.builtin_actions(),
                starter.sections.recent_files(10, false),
                starter.sections.recent_files(10, true)
            },
            content_hooks = {
                starter.gen_hook.adding_bullet(),
                starter.gen_hook.aligning("center", "center")
            }
        }
    end
}, {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup {
            options = { theme = "material-stealth", global_status = true },
            extensions = { "nvim-tree" }
        }
    end
}, {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function() require("toggleterm").setup {} end
}, {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require("bufferline").setup {} end
}, {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("telescope").setup {} end
}, {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup {
            -- signs = {
            --     add = {text = ""},
            --     change = {text = ""},
            --     delete = {text = ""},
            --     topdelete = {text = ""},
            --     untracked = {text = ""}
            -- }
        }
    end
}, { dir = "/home/lime/amanatsu/syntax/vim/amanatsu-syntax-highlighting" }
}
