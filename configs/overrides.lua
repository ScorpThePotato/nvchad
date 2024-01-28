local M = {}

M.treesitter = {
  ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "html",

        -- utility
        "comment",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "passwd",
        "markdown",
        "markdown_inline",

        -- ricing
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "rasi",

        -- general
        "bash",
        "nix",
        "rust",
        "c",
        "cpp",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
  -- LSPs
    -- lua stuff
    "lua-language-server",

    -- Ricing and Web
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",

    -- General Purpose
    "clangd",
    "clang-format",
    --"nil",
    "rust-analyzer",
    "bash-language-server",

  -- Formatters
    "clang-format",
    "prettier",
    "prettierd",
    "stylua",
    "shfmt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.flash = {
  modes = {
    -- options used when flash is activated through
    -- `f`, `F`, `t`, `T`, `;` and `,` motions
    char = {
      enabled = false,
      -- dynamic configuration for ftFT motions
      config = function(opts)
        -- autohide flash when in operator-pending mode
        opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

        -- disable jump labels when not enabled, when using a count,
        -- or when recording/executing registers
        opts.jump_labels = opts.jump_labels
          and vim.v.count == 0
          and vim.fn.reg_executing() == ""
          and vim.fn.reg_recording() == ""

        -- Show jump labels only in operator-pending mode
        -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
      end,
      keys = { ";", "," },
    },
  },
}


return M
