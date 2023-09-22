local key = vim.keymap
local tl = require("telescope.builtin")
local wk = require("which-key")
wk.register({
    l = {
        name = "lsp",
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
        f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
        c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        e = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to definition" },

    },
    t = {
        name = "toggle_term",
        f = { "<cmd>ToggleTerm direction=float<cr>", "Toggle Floating Terminal" },
        h = {
            "<cmd>ToggleTerm direction=horizontal<cr>",
            "Toggle Horizontal Terminal"
        },
        v = {
            "<cmd>ToggleTerm direction=vertical<cr>", "Toggle Vertical Terminal"
        }
    },
    f = {
        name = "telescope",
        f = { tl.find_files, "Find Files" },
        g = { tl.live_grep, "Live Grep" },
        b = { tl.buffers, "Buffers" },
        h = { tl.help_tags, "Help Tags" },
        i = { tl.git_files, "Git Files" },
        t = { tl.treesitter, "Treesitter" }
    }
}, { prefix = "<leader>" })
wk.register({
    t = {
        name = "nvim_tree",
        t = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree" },
        c = { "<cmd>NvimTreeCollapse<cr>", "Collapse Tree" },
        r = { "<cmd>NvimTreeRefresh<cr>", "Refresh Tree" }
    }
})
key.set("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
key.set("v", "fy", "<cmd>ToggleTermSendVisualSelection<cr>",
    { noremap = false, silent = true })
key.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>")
key.set("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>")
