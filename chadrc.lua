---@type ChadrcConfig
local M = {}

-- local highlights = require "highlights"

M.ui = {
  theme = "material-darker",

  -- hl_override = highlights.override,
  -- hl_add = highlights.add,
  hl_override = {
    Comment = {
      italic = true,
      fg = "#2E7D32",
    },
    ["@comment"] = {
      italic = true,
      fg = "#2E7D32",
    },
  },
}

M.base46 = {
  integrations = {
    "blankline",
    "cmp",
    "defaults",
    "lsp",
    "mason",
    "nvimtree",
    "syntax",
    "treesitter",
    "telescope",
    "whichkey",
  },
}
return M
