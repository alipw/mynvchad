---@type MappingsTable
local M = {}

local curfile = function()
  return vim.api.nvim_buf_get_name(0)
end

-- more keybinds!
local compileCpp = function()
  local command = string.format("g++ -Wall -O %s && ./a.out ", curfile())
  require("nvterm.terminal").new "vertical"
  require("nvterm.terminal").send(command)
end

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><leader>c"] = { compileCpp, "Compile current file (C++)" },
    ["<leader>wv"] = { "<cmd>vsplit<CR>", "Vertical Split" },
    ["<leader>wh"] = { "<cmd>split<CR>", "Horizontal Split" },
    ["<leader>jp"] = { "<cmd>HopPattern<CR>", "Hop Pattern" },
    ["<leader>jw"] = { "<cmd>HopWord<CR>", "Hop Word" },
    ["<leader>jl"] = { "<cmd>HopLine<CR>", "Hop Line" },
    ["<leader>jkl"] = { "<cmd>HopAnywhereCurrentLine<CR>", "Hop Current Line" },
    ["<leader><leader>s"] = { ":SymbolsOutline<CR>", "Symbols Outline" },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" },
    ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" },
  },

  v = {
    ["<leader>hp"] = { "<cmd>HopPattern<CR>", "Hop Pattern" },
    ["<leader>w"] = { "<cmd>HopWord<CR>", "Hop Word" },
    ["<leader>jp"] = { "<cmd>HopPattern<CR>", "Hop Pattern" },
    ["<leader>jw"] = { "<cmd>HopWord<CR>", "Hop Word" },
    ["<leader>jl"] = { "<cmd>HopLine<CR>", "Hop Line" },
    ["<leader>jkl"] = { "<cmd>HopAnywhereCurrentLine<CR>", "Hop Current Line" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

return M
