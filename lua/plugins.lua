return {
    -- Main Theme Setup
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                integrations = {
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                    gitsigns = true,
                    harpoon = true,
                    mason = true
                }
            })

            vim.cmd([[colorscheme catppuccin]])
        end
    }, -- Status Bar
    {
        "feline-nvim/feline.nvim",
        config = function()
            local ctp_feline = require("catppuccin.groups.integrations.feline")
            require("feline").setup({ components = ctp_feline.get() })
        end
    }, -- Telescope Setup
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("telescope").load_extension("fzf") end
    }, { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- Treesitter Setup
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "javascript", "typescript", "tsx", "go", "gomod", "rust",
                    "lua", "python"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    }, { "nvim-treesitter/nvim-treesitter-context" }, -- LSP Setup
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' }, { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'nvimtools/none-ls.nvim' }, { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' }, { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' }, { "hrsh7th/cmp-cmdline" },
            { 'hrsh7th/cmp-nvim-lua' }, { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' }, { "onsails/lspkind-nvim" },
            { 'rafamadriz/friendly-snippets' }
        }
    }, -- Mason Null Ls Setup
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim", "nvimtools/none-ls.nvim"
        }
    },                                                                                          -- Harpoon Setup
    { "ThePrimeagen/harpoon",       lazy = true },                                              -- Gitsigns Setup
    { "lewis6991/gitsigns.nvim",    opts = {} },                                                -- Copilot setup
    { "github/copilot.vim" },                                                                   -- Toggleterm Setup
    { 'akinsho/toggleterm.nvim',    version = "*",                             config = true }, -- Comment Setup
    { 'numToStr/Comment.nvim',      opts = { mappings = false },               lazy = false },  -- Autopairs Setup
    { 'windwp/nvim-autopairs',      event = "InsertEnter",                     opts = {} },     -- Autotag Setup
    { "windwp/nvim-ts-autotag",     opts = {} },                                                -- Todo Comment Setup
    { "folke/todo-comments.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },               -- Modern netrw
    { 'prichrd/netrw.nvim' },                                                                   -- Web Devicons Setup
    { "nvim-tree/nvim-web-devicons" },
    {
        "NStefan002/screenkey.nvim",
        lazy = false,
        version = "*", -- or branch = "dev", to use the latest commit
    },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-j>",
                    accept_word = "<Tab>"
                }
            })
        end,
    },
    { "b0o/schemastore.nvim" }
}
