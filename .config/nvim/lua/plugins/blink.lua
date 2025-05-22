return {
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {
      "moyiz/blink-emoji.nvim",
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "emoji", "dadbod" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 93, -- the higher the number, the higher the priority
            min_keyword_length = 2,
            opts = { insert = true }, -- Insert emoji (default) or complete its name
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
            -- min_keyword_length = 2,
            score_offset = 85, -- the higher the number, the higher the priority
          },
        },
      },
    },
  },
}
