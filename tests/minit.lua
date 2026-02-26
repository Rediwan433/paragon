#!/usr/bin/env -S nvim -l

vim.env.LAZY_STDPATH = ".tests"
vim.env.LAZY_PATH = vim.fs.normalize("~/projects/lazy.nvim")

if vim.fn.isdirectory(vim.env.LAZY_PATH) == 1 then
	loadfile(vim.env.LAZY_PATH .. "/bootstrap.lua")()
else
	load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"), "bootstrap.lua")()
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.inccommand = "split"
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = false
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.cursorline = true
opt.wrap = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.scrolloff = 8
opt.colorcolumn = "100"
opt.cursorcolumn = false
opt.foldcolumn = "1"
opt.termguicolors = true
opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
opt.formatoptions:remove("o")

local plugins = {
	{
		dir = vim.uv.cwd(),
		opts = {
			plugins = {},
		},
		priority = 1000,
		lazy = false,
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	},
	{
		"echasnovski/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({ options = { theme = "paragon_transparent", globalstatus = true } })
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				columns = {
					"icon",
				},
				buf_options = {
					buflisted = false,
					bufhidden = "hide",
				},
				win_options = {
					wrap = false,
					signcolumn = "no",
					cursorcolumn = false,
					foldcolumn = "0",
					spell = false,
					list = false,
					conceallevel = 3,
					concealcursor = "nvic",
					cursorline = true,
				},
				delete_to_trash = true,
				skip_confirm_for_simple_edits = false,
				prompt_save_on_select_new_entry = true,
				cleanup_delay_ms = 2000,
				lsp_file_methods = {
					enabled = false,
				},
				constrain_cursor = "editable",
				watch_for_changes = false,
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-s>"] = { "actions.select", opts = { vertical = true } },
					["<C-h>"] = { "actions.select", opts = { horizontal = true } },
					["<C-t>"] = { "actions.select", opts = { tab = true } },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = { "actions.cd", opts = { scope = "tab" } },
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
					["g\\"] = "actions.toggle_trash",
				},
				use_default_keymaps = false,
				view_options = {
					show_hidden = true,
					is_hidden_file = function(name, bufnr)
						return name:match("^%.") ~= nil
					end,
					is_always_hidden = function(name, bufnr)
						return name == "__pycache__" or name:match("%.pyc$")
					end,
					natural_order = "fast",
					case_insensitive = false,
					sort = {
						{ "type", "asc" },
						{ "name", "asc" },
					},
					highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
						local hl_group = nil
						local ok, stat = pcall(vim.uv.fs_stat, entry.path)
						if ok and stat and stat.type == "directory" then
							hl_group = "Directory"
						end
						if is_hidden and not hl_group then
							hl_group = "Comment"
						end
						if is_link_orphan then
							hl_group = "ErrorMsg"
						end
						return hl_group
					end,
				},
				extra_scp_args = {},
				git = {
					add = function(path)
						return false
					end,
					mv = function(src_path, dest_path)
						return false
					end,
					rm = function(path)
						return false
					end,
				},
				float = {
					padding = 2,
					max_width = 0,
					max_height = 0,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
					get_win_title = nil,
					preview_split = "auto",
					override = function(conf)
						return conf
					end,
				},
				preview_win = {
					update_on_cursor_moved = true,
					preview_method = "fast_scratch",
					disable_preview = function(filename)
						return false
					end,
					win_options = {
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					},
				},
				confirmation = {
					max_width = 0.9,
					min_width = { 40, 0.4 },
					width = nil,
					max_height = 0.9,
					min_height = { 5, 0.1 },
					height = nil,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
				},
				progress = {
					max_width = 0.9,
					min_width = { 40, 0.4 },
					width = nil,
					max_height = { 10, 0.9 },
					min_height = { 5, 0.1 },
					height = nil,
					border = "rounded",
					minimized_border = "none",
					win_options = {
						winblend = 0,
					},
				},
				ssh = {
					border = "rounded",
				},
				keymaps_help = {
					border = "rounded",
				},
			})

			vim.api.nvim_set_keymap("n", "<leader>e", ":Oil<CR>", { noremap = true, silent = true, desc = "Oil" })
		end,
	},
	-- { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
		end,
	},
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	opts = {},
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 	},
	-- },

	{ "akinsho/bufferline.nvim", version = "*", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
	-- {
	-- 	"romgrk/barbar.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	init = function()
	-- 		vim.g.barbar_auto_setup = false
	-- 	end,
	-- 	opts = {},
	-- },

	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = { expand = function() end },
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},

				sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "buffer" } }),
				window = {
					completion = cmp.config.window.bordered({
						border = "single",
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						border = "single",
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None",
					}),
				},
			})
		end,
	},

	-- {
	-- 	"saghen/blink.cmp",
	-- 	lazy = false,
	-- 	version = "v0.*",
	-- 	dependencies = { "rafamadriz/friendly-snippets" },
	-- 	opts = {
	-- 		keymap = {
	-- 			preset = "default",
	-- 			["<C-n>"] = { "select_next", "fallback" },
	-- 			["<C-p>"] = { "select_prev", "fallback" },
	-- 			["<CR>"] = { "accept", "fallback" },
	-- 		},
	-- 		appearance = {
	-- 			use_nvim_cmp_as_default = true,
	-- 			nerd_font_variant = "mono",
	-- 		},
	-- 		sources = {
	-- 			default = { "lsp", "path", "snippets", "buffer" },
	-- 		},
	-- 		completion = {
	-- 			menu = {
	-- 				auto_show = true,
	-- 				border = "rounded",
	-- 			},
	-- 			documentation = {
	-- 				auto_show = true,
	-- 				window = { border = "rounded" },
	-- 			},
	-- 		},
	-- 	},
	-- },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter")
				.install({
					"go",
					"python",
					"json",
					"html",
					"c",
					"cpp",
					"lua",
					"javascript",
					"typescript",
					"java",
					"c_sharp",
					"php",
					"ruby",
					"rust",
					"swift",
					"kotlin",
					"dart",
					"scala",
					"perl",
					"r",
					"julia",
					"zig",
					"css",
					"haskell",
					"elixir",
					"erlang",
					"ocaml",
					"clojure",
					"bash",
					"sql",
					"markdown",
					"markdown_inline",
					"yaml",
					"toml",
					"vim",
					"vimdoc",
					"regex",
				})
				:wait(300000)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"go",
					"python",
					"c",
					"cpp",
					"html",
					"lua",
					"json",
					"javascript",
					"typescript",
					"java",
					"cs",
					"php",
					"ruby",
					"rust",
					"swift",
					"kotlin",
					"dart",
					"scala",
					"perl",
					"r",
					"julia",
					"css",
					"zig",
					"haskell",
					"elixir",
					"erlang",
					"ocaml",
					"clojure",
					"sh",
					"bash",
					"zsh",
					"sql",
					"markdown",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context", opts = {} },
	{ "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"pyright",
					"ts_ls",
					-- C/C++
					"clangd",
					-- Rust
					"rust_analyzer",
					-- Lua
					"lua_ls",
					-- Ruby
					"ruby_lsp",
					-- Swift
					-- Kotlin
					"zls",
					-- PHP
					"intelephense",
					-- HTML
					"html",
					-- Haskell
					-- Elixir
					"elixirls",
					-- Perl
					"perlnavigator",
					-- Clojure
					"bashls",
					-- SQL
					"sqlls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"nvim-mini/mini.pick",
		version = false,
		config = function()
			require("mini.pick").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
		},
		config = function()
			require("lazydev").setup({})
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.offsetEncoding = { "utf-16" }
			capabilities.workspace = capabilities.workspace or {}
			capabilities.workspace.didChangeWatchedFiles = {
				dynamicRegistration = true,
			}

			local function on_attach(_, bufnr)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gD",
					"<Cmd>rightbelow vsplit<CR><Cmd>lua vim.lsp.buf.definition()<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gd",
					"<Cmd>lua vim.lsp.buf.hover({border = 'single'})<CR>",
					{ noremap = true, silent = true }
				)
			end

			local servers = {
				gopls = {
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							templateExtensions = { "gohtml", "gotmpl", "tmpl" },
						},
					},
				},
				pyright = {
					settings = {
						pyright = {},
						python = {
							analysis = {
								ignore = { "*" },
								typeCheckingMode = "off",
							},
						},
					},
				},
			}

			for name, config in pairs(servers) do
				config = vim.tbl_deep_extend("force", {
					capabilities = capabilities,
					on_attach = on_attach,
				}, config)

				vim.lsp.config(name, config)
			end

			vim.diagnostic.config({
				-- update_in_insert = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
				},
			})
		end,
	},
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },

	-- { "lewis6991/gitsigns.nvim", opts = {} },
	-- { "airblade/vim-gitgutter" },
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		cmd = "Neogit",
		keys = { { "<leader>gg", "<cmd>Neogit<cr>" } },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
	},

	-- { "folke/noice.nvim", event = "VeryLazy", dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
	-- { "rcarriga/nvim-notify", opts = {} },
	{
		lazy = false,
		priority = 1000,
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				row = nil,
				col = nil,
				width = 50,
				pane_gap = 0,
				preset = {
					keys = {
						{
							icon = " ",
							key = "SPC e",
							desc = "File Explorer",
							action = "",
						},
						{
							icon = " ",
							key = "SPC f f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{
							icon = "󰈭 ",
							key = "SPC /",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
					header = [[
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡴⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⣿⡅⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣴⣿⣿⣿⣿⣯⣤⣶⣶⣾⣿⣶⣶⣿⣿⣿⣿⣿⡿⠿⠟⠛⠉⠉⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠉⠁⠈⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⠶⠶⠦⠄⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣾⡿⠟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣟⣡⣤⣾⣿⣿⣿⣿⣿⣿⢏⠉⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⡻⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠈⠻⡄⠁⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠈⠙⠻⣿⣆⠀⠀⠀⠀
	⠀⠀⠀⠀⢰⣿⣿⣿⣿⡿⠛⠉⠉⠉⠛⠛⠛⠛⠋⠁⠀⠀⠀⠁⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠈⠙⢧⠀⠀⠀
	⠀⠀⠀⠀⠀⠙⠿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠁⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠙⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⢀⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢹⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠈⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⢋⣩⡿⠿⠿⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀
	⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⣀⡀⠀⠀⠀⠀⠀⠐⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⣾⣿⣿⣿⣿⣿⣿⣿⠻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⢰⣿⣿⣿⣿⣿⣿⣿⣿⡄⠙⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠠⣤⣀⠀⠀⠀⠠⣄⣀⣀⡉⢻⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀
	⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣦⣤⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀
	⠀⢻⡟⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠛⠋⠉⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀
	⠀⠀⠃⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠈⠉⠻⢿⣿⣿⣿⣷⡄⠀
	⠀⠀⠀⠀⢸⣿⣿⡟⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⣿⣿⣿⣿⣿⣧⣀⣀⡄⠀⠀⠀⠀⠀⠀⠈⣿⡿⣿⣿⣷⠀
	⠀⠀⠀⠀⢸⣿⡿⠁⠀⠀⠀⠙⠻⠿⣟⠻⢿⣿⣿⣿⣷⣦⡀⠀⠈⠻⢿⣿⣿⣭⣉⡉⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠸⣿⣿⡄
	⠀⠀⠀⠀⣸⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣦⡀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠁
	⠀⠀⠀⠠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡟⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠟⠀⠀
	⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀
	]],
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
				},
			},
			bigfile = { enable = true },
			input = { enabled = true },
			notifier = { enabled = true, timeout = 3000 },
			picker = {
				previewers = {
					diff = { builtin = false },
					git = { builtin = false },
				},
				layout = { preset = "default" },
				sources = {
					files = { hidden = true },
					grep = { hidden = true },
					select = {
						kinds = {
							sidekick_cli = { layout = { preset = "vscode" } },
							sidekick_prompt = { layout = { preset = "vscode" } },
						},
					},
				},
			},
			quickfile = { enabled = true },
			scope = { enabled = true },
			scratch = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			styles = {
				notification = {
					wo = { wrap = true },
				},
			},
		},

		keys = {
			{
				"<leader>gb",
				function()
					Snacks.git.blame_line()
				end,
				desc = "Git Blame Line",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},

			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},

			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},

			{
				"<leader>xX",
				function()
					Snacks.picker.diagnostics({
						layout = {
							preset = "default",
							preview = false,
						},
					})
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>xx",
				function()
					Snacks.picker.diagnostics_buffer({
						layout = {
							preset = "default",
							preview = false,
						},
					})
				end,
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>hC",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			{
				"<leader>u",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},
			-- {
			-- 	"<leader>e",
			-- 	function()
			-- 		Snacks.explorer()
			-- 	end,
			-- 	desc = "File Explorer",
			-- },
			{
				"<leader>nh",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>sn",
				function()
					Snacks.scratch()
				end,
				desc = "Scratch Buffer",
			},
			{
				"<leader>sz",
				function()
					Snacks.zen()
				end,
				desc = "Zen Mode",
			},
			{
				"<leader>st",
				function()
					Snacks.terminal()
				end,
				desc = "Terminal",
			},
			{
				"<leader>sr",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>sR",
				function()
					Snacks.repl.toggle()
				end,
				desc = "Toggle REPL",
			},
			{
				"<leader>so",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Open Buffers",
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>s?",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Grep Word",
				mode = { "n", "x" },
			},
			{
				"<leader>tnf",
				function()
					Snacks.notifier.notify("This is an error notification", "error")
				end,
				desc = "Test Notify Error",
			},
			{
				"<leader>tnw",
				function()
					Snacks.notifier.notify("This is a warning notification", "warn")
				end,
				desc = "Test Notify Warning",
			},
			{
				"<leader>tni",
				function()
					Snacks.notifier.notify("This is an info notification", "info")
				end,
				desc = "Test Notify Info",
			},
			{
				"<leader>tnd",
				function()
					Snacks.notifier.notify("This is a debug notification", "debug")
				end,
				desc = "Test Notify Debug",
			},
		},
	},
	-- { "lambdalisue/glyph-palette.vim" },

	-- { "stevearc/aerial.nvim", opts = {} },
	-- { "MagicDuck/grug-far.nvim", opts = {} },
	-- { "nvimdev/indentmini.nvim", opts = {} },

	-- { "mfussenegger/nvim-dap" },
	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	-- { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },

	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	config = function()
	-- 		require("lspsaga").setup({})
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter", -- optional
	-- 		"nvim-tree/nvim-web-devicons", -- optional
	-- 	},
	-- },
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			require("fff.download").download_or_build_binary()
		end,
		opts = {
			debug = {
				enabled = true,
				show_scores = true,
			},
		},
		lazy = false,
		keys = {
			{
				"zz",
				function()
					require("fff").find_files()
				end,
				desc = "FFFind files",
			},
		},
	},
	{ "folke/lazy.nvim", version = false },
}

require("lazy.minit").setup({ spec = plugins })

vim.keymap.set("n", "<leader>z", "<cmd>Inspect<CR>", { desc = "Inspect highlight" })
vim.keymap.set("n", "<leader>ts", function()
	if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] then
		vim.treesittertree.stop()
		print("Tree-sitter OFF")
	else
		vim.treesitter.start()
		print("Tree-sitter ON")
	end
end, { desc = "Toggle Treesitter" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.hover, { desc = "LSP Hover" })

local theme = require("paragon")
theme.load()

vim.api.nvim_create_user_command("ReloadTheme", function()
	for k in pairs(package.loaded) do
		if k:find("^paragon") then
			package.loaded[k] = nil
		end
	end
	theme.load()
	print("Theme reloaded")
end, {})

vim.keymap.set("n", "<leader>r", ":ReloadTheme<CR>", {})
