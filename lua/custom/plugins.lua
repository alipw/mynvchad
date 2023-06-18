local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "phaazon/hop.nvim",
    version = "v2",
    event = "VeryLazy",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    event = "VeryLazy",
    config = function()
      require("symbols-outline").setup()
    end,
  },

  {
    "f-person/git-blame.nvim",
    event = "BufEnter",
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require("gitsigns").setup {
        signs = {
          add = { text = "+" },
          change = { text = "│" },
          delete = { text = "-" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
      }
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    version = "*",
    config = function()
      require("scrollbar").setup {
        show = true,
        show_in_active_only = false,
        set_highlights = true,
        folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
        max_lines = false, -- disables if no. of lines in buffer exceeds this
        hide_if_all_visible = false, -- Hides everything if all lines are visible
        throttle_ms = 100,
        handle = {
          text = " ",
          blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
          color = nil,
          color_nr = nil, -- cterm
          highlight = "CursorColumn",
          hide_if_all_visible = true, -- Hides handle if all lines are visible
        },
        marks = {
          Cursor = {
            text = "•",
            priority = 0,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
          },
          Search = {
            text = { "-", "=" },
            priority = 1,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Search",
          },
          Error = {
            text = { "-", "=" },
            priority = 2,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
          },
          Warn = {
            text = { "-", "=" },
            priority = 3,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
          },
          Info = {
            text = { "-", "=" },
            priority = 4,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextInfo",
          },
          Hint = {
            text = { "-", "=" },
            priority = 5,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextHint",
          },
          Misc = {
            text = { "-", "=" },
            priority = 6,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
          },
          GitAdd = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsAdd",
          },
          GitChange = {
            text = "┆",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsChange",
          },
          GitDelete = {
            text = "▁",
            priority = 7,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsDelete",
          },
        },
        excluded_buftypes = {
          "terminal",
        },
        excluded_filetypes = {
          "cmp_docs",
          "cmp_menu",
          "noice",
          "prompt",
          "TelescopePrompt",
        },
        autocmd = {
          render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
          },
          clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
          },
        },
        handlers = {
          cursor = true,
          diagnostic = true,
          gitsigns = false, -- Requires gitsigns
          handle = true,
          search = false, -- Requires hlslens
          ale = false, -- Requires ALE
        },
      }
    end,
    event = "BufEnter"
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
