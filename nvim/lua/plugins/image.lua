return {
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      backend = "kitty", -- or "ueberzug" / "wezterm" / "none"
      integrations = {
        markdown = { enabled = true, clear_in_insert_mode = true, download_remote_images = true },
        neorg = { enabled = true },
        html = { enabled = true },
      },
      max_width = nil,
      max_height = nil,
    },
  },
}
