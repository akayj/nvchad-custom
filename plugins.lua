local overrides = require("custom.configs.overrides")

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
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
			require("lspconfig").bufls.setup({})
		end, -- Override to setup mason-lspconfig
	},

	{
		"nvimdev/guard.nvim",
    dependencies = {
        "nvimdev/guard-collection",
    },
		init = function(_)
			local ft = require("guard.filetype")
			ft("c"):fmt("clang-format"):lint("clang-tidy")
			ft("cpp"):fmt("clang-format"):lint("clang-tidy")

      ft("lua"):fmt("stylua")

			-- ft("go"):fmt("golines"):lint("golangci-lint")
      ft("go"):fmt({
        cmd = "golines",
        args = { "-m", 128 },
      }):lint({
        cmd='golangci-lint',
        args={'run', '--disable-all', '-E', 'errcheck'},
        stdin=true,
      })
			ft("rust"):fmt("lsp"):append("rustfmt")

			-- ft("proto"):fmt("buf")

			ft("sh"):fmt("shfmt"):lint("shellcheck")

			ft("yaml"):fmt("prettier")

			ft("typescript,javascript,typescriptreact"):fmt("prettier")
		end,
		config = function()
			-- Call setup() LAST!
			require("guard").setup({
				-- the only options for the setup function
				fmt_on_save = true,
				-- Use lsp if no formatter was defined for this filetype
				lsp_as_default_formatter = false,
			})
		end,
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

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			local notify = require("notify")
			vim.notify = notify
			notify.setup()
		end,
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
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = "CmdlineEnter",
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},

	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			-- Debugging
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	},

	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("crates").setup()
		end,
	},

	{
		"daskol/nvim-bnf",
		config = function() end,
	},

	{
		"IndianBoy42/tree-sitter-just",
		requires = { { "NoahTheDuke/vim-just" } },
		config = function()
			require("tree-sitter-just").setup()
		end,
	},

	-- {
	--   "wgwoods/vim-systemd-syntax",
	--   config = function()
	--     require("vim-systemd-syntax").setup()
	--   end,
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
