local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang_format"}
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 200,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
