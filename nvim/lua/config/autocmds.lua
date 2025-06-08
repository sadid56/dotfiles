-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--
vim.keymap.set("n", "rsc", function()
  local filename = vim.fn.expand("%:t:r")
  local component_name = filename:gsub("^%l", string.upper)

  local lines = {
    "import React from 'react';",
    "",
    "",
    "const " .. component_name .. " = () => {",
    "  return (",
    "    <div>",
    "      <h1>Hello .. component_name .</h1>",
    "    </div>",
    "  );",
    "};",
    "",
    "export default " .. component_name .. ";",
  }

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, { desc = "Insert React Component" })
