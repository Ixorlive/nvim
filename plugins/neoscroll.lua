return {
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup {
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      }
      local t = {}
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "80" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "80" } }
      t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "55" } }
      t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "55" } }
      t["<C-y>"] = { "scroll", { "-0.10", "false", "80" } }
      t["<C-e>"] = { "scroll", { "0.10", "false", "80" } }
      t["zt"] = { "zt", { "200" } }
      t["zz"] = { "zz", { "200" } }
      t["zb"] = { "zb", { "200" } }
      require("neoscroll.config").set_mappings(t)
    end,
  },
}
