local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"vimdoc",

		"bash",
		"c",
		"cpp",

		"lua",
		"luadoc",

		"dockerfile",

		-- webdev
		"css",
		"scss",
		"html",
		"htmldjango",
		"javascript",
		"typescript",
		"tsx",
		"vue",

		"markdown",
		"markdown_inline",
		"yaml",
		"toml",
		"json",

		"gitignore",
		"git_config",
		"gitcommit",

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
		-- beautysh
		"beautysh",

		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",

		-- "vetur-vls", -- vue
		"vue-language-server", -- vue(volar)

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- sh/bash
		"shellcheck",
		"shfmt",

		-- golang
		"gopls",

		-- rust
		"rust-analyzer",

		-- protobuf
		"buf-language-server",
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
