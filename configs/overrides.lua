local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "vim",
    "lua",
    "html",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "yaml",
    "toml",
    "json",
    "go",
    "gomod",
    "gosum",
    "rust",
    "python",
    "proto",
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
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- sh/bash
    "shellcheck",

    -- golang
    "gopls",

    -- rust
    "rust-analyzer",
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
