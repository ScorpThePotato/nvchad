local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "nvim-telescope/telescope.nvim",
    optional = true,

    opts = function(_, opts)
      local function flash(prompt_bufnr)
        require("flash").jump {
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        }
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          n = { Q = flash },
          i = { ["<c-s>"] = flash },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
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
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = { "o" }, function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  --  {
  --    "kdheepak/lazygit.nvim",
  --    dependencies = {
  --      "nvim-telescope/telescope.nvim",
  --      "nvim-lua/plenary.nvim",
  --    },
  --    config = function()
  --      require("telescope").load_extension "lazygit"
  --    end,
  --    keys = {},
  --  },

  {
    "kylechui/nvim-surround",
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "nguyenvukhang/nvim-toggler",
    config = function()
      require("nvim-toggler").setup {
        remove_default_keybinds = true,
      }
    end,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "fraso-dev/nvim-listchars",
    lazy = false,
    config = function()
      require("nvim-listchars").setup {
        save_state = true, -- If enabled, save toggled state in a cache file. Will overwrite current `vim.opt.list` value.
        listchars = { -- `listchars` to be displayed. See available options by running `:help listchars`
          eol = "󰌑",
          tab = "» ",
          trail = "-",
          nbsp = "󱓇",
        },
        exclude_filetypes = {}, -- List of filetypes where `listchars` is disabled
        lighten_step = 5, -- Amount to add/remove from base color
      }
    end,
  },

  {
    "junegunn/vim-peekaboo",
    lazy = false,
  },

  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
    lazy = false,
    config = function()
      require("cmp").setup {
        sources = {
          { name = "nvim_lsp_signature_help" },
        },
      }
    end,
  },

  --  {
  --    "AckslD/nvim-neoclip.lua",
  --    requires = {
  --      {'nvim-telescope/telescope.nvim'},
  --    },
  --    config = function()
  --      require("neoclip").setup()
  --    end,
  --  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
