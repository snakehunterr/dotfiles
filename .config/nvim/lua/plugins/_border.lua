-- Set border of some LazyVim plugins to rounded

return {
  -- lazyvim.plugins.coding
  {
    "nvim-cmp",
    opts = function(_, opts)
      local bordered = require("cmp.config.window").bordered
      return vim.tbl_deep_extend("force", opts, {
        window = {
          completion = bordered(BORDER_STYLE),
          -- documentation = bordered(BORDER_STYLE),
        },
      })
    end,
  },
  -- lazyvim.plugins.editor
  {
    "which-key.nvim",
    opts = { win = { border = BORDER_STYLE } },
  },
  {
    "gitsigns.nvim",
    opts = { preview_config = { border = BORDER_STYLE } },
  },
  -- lazyvim.plugins.lsp
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      -- Set LspInfo border
      require("lspconfig.ui.windows").default_options.border = BORDER_STYLE
      return opts
    end,
  },
  {
    "mason.nvim",
    opts = {
      ui = { border = "rounded" },
    },
  },
  -- lazyvim.plugins.ui
  {
    "noice.nvim",
    opts = {
      presets = { lsp_doc_border = true },
    },
  },
}
