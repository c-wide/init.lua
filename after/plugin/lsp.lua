local cmp = require("cmp")
local lspkind = require("lspkind")
local null_ls = require("null-ls")

local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    "lua_ls", "tsserver", "gopls", "rust_analyzer", "jedi_language_server",
    "eslint", "biome", "jsonls", "tailwindcss"
})

lsp.nvim_workspace()

cmp.setup({
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then cmp.select_next_item() end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then cmp.select_prev_item() end
        end, { "i", "s" })
    }),
    sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } },
        { { name = "buffer" } }),
    formatting = { format = lspkind.cmp_format({ mode = "symbol", maxwidth = 50 }) }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.format_on_save {
    format_opts = { async = false, timeout_ms = 10000 },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['gopls'] = { 'go' },
        ['null-ls'] = {
            "javascript", "javascriptreact", "typescript", "typescriptreact",
            "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml",
            "markdown", "markdown.mdx", "graphql", "handlebars", "python"
        }
    }
}

require("mason-null-ls").setup({ ensure_installed = { "prettierd", "biome", "black" } })

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd, null_ls.builtins.formatting.biome, null_ls.builtins.formatting.black
    }
})

require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
})

require('lspconfig').jsonls.setup {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        },
    },
}

require("lspconfig").biome.setup({})

require("lspconfig").eslint.setup({})

require("lspconfig").tsserver.setup({})

require("lspconfig").tailwindcss.setup({
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                    { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" }
                },
            },
        },
    },
})

require("lspconfig").gopls.setup({
    settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } }
})

require("lspconfig").rust_analyzer.setup({})

require("lspconfig").jedi_language_server.setup({})

lsp.setup()
