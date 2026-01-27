local M = {}

M.base46 = { theme = "onedark" }

M.ui = {
  tabufline = {
    -- ... your existing tabufline config ...
  },
  statusline = {
    modules = {
      -- 1. Your existing dot function
      dot = function()
        return vim.bo.modified and "%#St_LspWarning# " or ""
      end,

      -- 2. NEW: Shortened CWD function
      cwd = function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":~") -- This converts /home/user to ~/
        return "%#St_cwd_sep#" .. "%#St_cwd_icon#󰉋 " .. "%#St_cwd_text# " .. dir_name .. " "
      end,

      -- 3. Your existing custom_cursor logic
      custom_cursor = function()
        -- ... (keep your existing logic here) ...
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        if total_lines == 0 then total_lines = 1 end
        local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        index = math.max(1, math.min(index, #chars))
        local percentage = string.format("%d%%%%", math.ceil(line_ratio * 100))
        return "%#St_pos_sep#" .. "%#St_pos_icon# " .. "%#St_pos_text# " .. chars[index] .. " " .. percentage .. " %l:%c "
      end,
    },

    order = {
      "mode",
      "file",
      "dot",
      "git",
      "%=",
      "lsp_msg",
      "diagnostics",
      "lsp",
      "cwd",           -- This will now use your custom 'cwd' function above
      "custom_cursor",
    },
  },
}

return M
