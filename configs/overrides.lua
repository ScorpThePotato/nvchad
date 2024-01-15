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

return M
