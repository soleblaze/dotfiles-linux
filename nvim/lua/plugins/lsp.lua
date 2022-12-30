return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local lsp = require('lsp-zero')

    lsp.preset('recommended')

    local cmp = require('cmp')

    local luasnip = require('luasnip')
    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    lsp.setup_nvim_cmp({
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
          elseif cmp and cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
          elseif cmp and cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<Down>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s", }),
        ["<Up>"] = cmp.mapping(function(fallback)
          if cmp and cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s", }),
      })
    })

    lsp.configure('gopls', {
      settings = {
        gopls = {
          gofumpt = true,
        },
      },
    })
    lsp.configure('yamlls', {
      on_attach = function(client, bufnr)
        if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
          vim.diagnostic.disable(bufnr)
          vim.defer_fn(function()
            vim.diagnostic.reset(nil, bufnr)
          end, 1000)
        end
      end
    })
    lsp.nvim_workspace()

    lsp.setup()
  end,
}
