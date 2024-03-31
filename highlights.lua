-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

-- @type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    fg = "#2E7D32",
  },
  Include = {
    fg = "#cba6f7",
    italic = true,
  },
  Define = {
    fg = "#cba6f7",
    italic = true,
  },
  Macro = {
    fg = "#F8BD96",
  },
  ["@namespace"] = {
    fg = "#FAE3B0",
    italic = true,
  },
  Type = {
    fg = "#cba6f7",
  },
  Identifier = {
    fg = "#ffffff",
  },
  ["@variable"] = {
    fg = "#ffffff",
  },
  ["@type.builtin"] = {
    fg = "#cba6f7",
  },
  ["@punctuation.bracket"] = {
    fg = "#9399b2",
  },
  ["@punctuation.delimiter"] = {
    fg = "#9399b2",
  },
  StorageClass = {
    fg = "#cba6f7",
    italic = true,
  },
  Structure = {
    fg = "#FAE3B0",
  },
  ["@lsp.type.enum.cpp"] = {
    fg = "#FAE3B0",
  },
  ["@operator"] = {
    fg = "#89DCEB",
  },
  Repeat = {
    fg = "#cba6f7",
  },
  ["@keyword.repeat"] = {
    fg = "#cba6f7",
  },
  ["@parameter"] = {
    fg = "#F38BA9",
  },
  ["@function"] = {
    fg = "#89B4FA",
    italic = true,
  },
  ["@method.call"] = {
    italic = true,
  },
  ["@function.call"] = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
