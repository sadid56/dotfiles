return {
  -- Git conflict visualizer and resolver
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = true, -- enable default keymaps
        default_commands = true, -- enable default commands
        disable_diagnostics = false, -- keep diagnostics during conflict
        highlights = {
          incoming = "DiffAdd", -- theirs
          current = "DiffText", -- ours
        },
        list_opener = "copen", -- quickfix list to see all conflicts
      })
    end,
    keys = {
      { "]x", "<cmd>GitConflictNextConflict<cr>", desc = "Next Git Conflict" },
      { "[x", "<cmd>GitConflictPrevConflict<cr>", desc = "Previous Git Conflict" },
      { "<leader>co", "<cmd>GitConflictChooseOurs<cr>", desc = "Choose Ours (Current)" },
      { "<leader>ct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Choose Theirs (Incoming)" },
      { "<leader>cb", "<cmd>GitConflictChooseBoth<cr>", desc = "Choose Both" },
      { "<leader>cn", "<cmd>GitConflictChooseNone<cr>", desc = "Choose None" },
      { "<leader>cx", "<cmd>GitConflictListQf<cr>", desc = "List All Conflicts" },
    },
  },

  -- Diff viewer for staged/unstaged files and merge resolution
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
    },
    config = true,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Git Diff View" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Git File History" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    },
  },
}
