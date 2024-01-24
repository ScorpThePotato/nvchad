--@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<leader>fc"] = { function() require("telescope.builtin").find_files({ cwd = "$HOME/.config/nvim/lua/custom/" }) end, "Find config file"},

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

  },

  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.flash = {
  n = {
    ["q"] = { function() require("flash").jump() end, "Flash"},
    ["Q"] = { function() require("flash").treesitter() end, "Flash Treesitter"},
  },

  x = {
    ["q"] = { function() require("flash").jump() end, "Flash"},
    ["Q"] = { function() require("flash").treesitter() end, "Flash Treesitter"},
    ["R"] = { function() require("flash").treesitter_search() end, "Treesitter Search"},
  },

  o = {
    ["q"] = { function() require("flash").jump() end, "Flash"},
    ["Q"] = { function() require("flash").treesitter() end, "Flash Treesitter"},
    ["r"] = { function() require("flash").remote() end, "Remote Flash"},
    ["R"] = { function() require("flash").treesitter_search() end, "Treesitter Search"},
  },

  c = {
    ["<c-s>"] = { function() require("flash").toggle() end, "Toggle Flash Search"},
  },
}

-- more keybinds!

return M
