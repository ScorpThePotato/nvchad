--@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

M.leap = {
  n = {
    ["q"] = { "<Plug>(leap-forward)", "Leap forward"},
    ["Q"] = { "<Plug>(leap-backward)", "Leap backward"},
    ["gq"] = { "<Plug>(leap-from-window)", "Leap from window"},
  },
}

-- more keybinds!

return M
