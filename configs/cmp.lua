vim.api.nvim_set_hl(0, "CmpGhostText", { fg = "#616161" })

return {
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  experimental = {
    ghost_text = {
      hl_group = "CmpGhostText",
    },
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}
