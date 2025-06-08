-- lua/plugins/presence.lua
return {
  "andweeb/presence.nvim",
  cond = function()
    -- Only enable Presence when Neovim is launched without opening files
    return vim.fn.argc(-1) == 0
  end,
  config = function()
    require("presence").setup({
      -- General options
      auto_update = true,
      neovim_image_text = "The One True Text Editor",
      main_image = "neovim",
      client_id = "793271441293967371",
      log_level = nil,
      debounce_timeout = 10,

      -- Rich Presence text options
      enable_line_number = false,
      editing_text = "Editing %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading %s",
      workspace_text = "Working on %s",
      line_number_text = "Line %s out of %s",
    })
  end,
}
