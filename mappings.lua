--@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<leader>fc"] = { function() require("telescope.builtin").find_files({ cwd = "$HOME/.config/nvim/lua/custom/" }) end, "Find config file"},
    ["<leader>Q"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Use QuickFix" },

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

M.toggler = {
  n = {
    ["<leader>i"] = { function() require("nvim-toggler").toggle() end, "Invert Word"},
  },
}

M.lazygit = {
  n = {
    ["<leader>gl"] = {function ()
        require("telescope").extensions.lazygit.lazygit()
      end,
      "LazyGit"
    }
  }
}
-- more keybinds!

return M
