-- ~/.local/share/nvim/lazy/ui/lua/nvchad/colorify/init.lua
local M = {}
local api = vim.api

local state = require "nvchad.colorify.state"
state.ns = api.nvim_create_namespace "Colorify"

M.attach = require "nvchad.colorify.attach"

M.run = function()
  api.nvim_create_autocmd({
    "TextChanged",
    "TextChangedI",
    "TextChangedP",
    "VimResized",
    "LspAttach",
    "WinScrolled",
    "BufEnter",
  }, {
    callback = function(args)
      -- ✅ Safe buffer check
      if vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].bl then
        M.attach(args.buf, args.event)
      end
    end,
  })
end

return M
