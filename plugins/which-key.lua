return {
  {
    "folke/which-key.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      local present, wk = pcall(require, "which-key")
      if not present then
        return
      end
      wk.register {
        -- add group
        ["<leader>"] = {
          f = { name = "Find" },
          l = { name = "LSP" },
          g = { name = "Git" },
          c = { name = "NvChad configuration" },
          W = { name = "Whichkey" },
          m = { name = "Moving" },
        },
      }
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },
}
