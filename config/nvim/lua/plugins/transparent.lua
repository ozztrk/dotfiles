return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false, -- Load eagerly to ensure highlight-clearing works
    config = function()
      -- Enable transparent mode
      require("transparent").setup({
        enable = true, -- Start with transparency enabled
        groups = { -- Additional groups to clear
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {
          -- "NeoTreeNormal",
          -- "NeoTreeEndOfBuffer",
        },
        exclude = {}, -- Add groups to exclude if needed
      })
    end,
  },
}
