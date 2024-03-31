local map = vim.keymap.set
-- General mappings
map("n", "<Esc>", ":noh <CR>", { desc = "Clear highlights" })
map("n", "<leader>cn", "<cmd> set rnu! <CR>", { desc = "Toggle relative number" })
map("n", ";", ":", { desc = "enter command mode", nowait = true })
map("n", "<leader>v", ":vs<CR>", { desc = "Split Vertical" })
map("n", "<leader>h", ":split<CR>", { desc = "Split Horizontal" })
map("n", "<leader>z", ":qa<CR>", { desc = "Exit" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Close window", nowait = true })
map("n", "<leader>Q", ":q!<CR>", { desc = "Close window without saving", nowait = true })
map("i", "<C-v>", "<ESC>pa", { desc = "Paste in insert mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })
map("n", "<C-p>", ":pu<CR>", { desc = "Past into next line" })

-- tabufline
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Focus window" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope Help page" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find all files" }
)
map("n", "<leader>a", "<cmd> Telescope marks <CR>", { desc = "telescope bookmarks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope Git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "Telescope Pick hidden term" })
map("n", "<leader>ct", "<cmd>Telescope themes<CR>", { desc = "Telescope Nvchad themes" })

-- Project manager
map("n", "<leader>p", ":ProjectMgr <CR>", { desc = "Open ProjectMgr" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

-- new terminals
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
end, { desc = "Terminal Toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "Blankline Jump to current context" })

-- LSP Configurations
map("n", "<leader>ld", function()
  vim.lsp.buf.type_definition()
end, { desc = "LSP definition type" })
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Lsp Show signature help" })
map("n", "<leader>lr", function()
  require "nvchad.lsp.renamer"()
end, { desc = "Lsp NvRenamer" })
map({ "n", "v" }, "<leader>la", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP code action" })
map("n", "<leader>lc", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
map("n", "<leader>lq", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })
map("n", "<leader>lf", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP formatting" })
map("n", "<leader>lw", function()
  vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder" })
map("n", "<leader>lv", function()
  vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder" })
map("n", "<leader>ll", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- Telescope
map("n", "<leader>ft", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" })
map("n", "<leader>ct", "<cmd> Telescope themes <CR>", { desc = "Nvchad themes" })
map("n", "<leader>a", "<cmd> Telescope marks <CR>", { desc = "Telescope bookmarks" })

-- Whichkey
map("n", "<leader>WK", function()
  vim.cmd "WhichKey"
end, { desc = "Which-key all keymaps" })
map("n", "<leader>Wk", function()
  local input = vim.fn.input "WhichKey: "
  vim.cmd("WhichKey " .. input)
end, { desc = "Which-key query lookup" })

-- Blankline
map("n", "<leader>mc", function()
  local ok, start = require("indent_blankline.utils").get_current_context(
    vim.g.indent_blankline_context_patterns,
    vim.g.indent_blankline_use_treesitter_scope
  )

  if ok then
    vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
    vim.cmd [[normal! _]]
  end
end, { desc = "Jump to current context" })

-- Gitsigns
map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk", expr = true })

map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to prev hunk", expr = true })

map("n", "<leader>gh", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
map("n", "<leader>gb", function()
  package.loaded.gitsigns.blame_line()
end, { desc = "Blame line" })
map("n", "<leader>gd", function()
  require("gitsigns").toggle_deleted()
end, { desc = "Toggle deleted" })

local disabled_keys = {
  { "n", "<leader>pt" },
  -- { "n", "<leader>cc" },
  -- { "n", "<leader>fm" },
  -- { "n", "<leader>td" },
  -- { "n", "<leader>th" },
  -- { "n", "<leader>wa" },
  -- { "n", "<leader>wk" },
  -- { "n", "<leader>wK" },
  -- { "n", "<leader>wl" },
  -- { "n", "<leader>wr" },
  -- { "n", "<leader>ph" },
  -- { "n", "<leader>pt" },
  -- { "n", "<leader>ra" },
  -- { "n", "<leader>rh" },
  -- { "n", "<leader>rn" },
}

-- for _, key in ipairs(disabled_keys) do
--   nomap(key[1], key[2])
-- end
