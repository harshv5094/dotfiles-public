return {

	-- { "nvim-neo-tree/neo-tree.nvim", enabled = false },
	-- Lazygit.nvim
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- Flash.nvim
	{
		enabled = false,
		"folke/flash.nvim",
		---@type Flash.Config
		opts = {
			search = {
				forward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},

	{
		"s1n7ax/nvim-window-picker",
		name = "window-picker",
		event = "VeryLazy",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				hint = "statusline-winbar",
				selection_chars = "FJDKSLA;CMRUEIWOQP",
				show_prompt = true,
				highlights = {
					statusline = {
						focused = {
							fg = "#ededed",
							bg = "#e35e4f",
							bold = true,
						},
						unfocused = {
							fg = "#ededed",
							bg = "#44cc41",
							bold = true,
						},
					},
					winbar = {
						focused = {
							fg = "#ededed",
							bg = "#e35e4f",
							bold = true,
						},
						unfocused = {
							fg = "#ededed",
							bg = "#44cc41",
							bold = true,
						},
					},
				},
			})
		end,
	},

	--  Telescope
	{
		"telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				";g",
				function()
					local builtin = require("telescope.builtin")
					builtin.git_files()
				end,
				desc = "Telescope -> Git Files",
			},
			{
				";F",
				function()
					local builtin = require("telescope.builtin")
					builtin.grep_string({
						search = vim.fn.input("Grep > "),
					})
				end,
				desc = "Telescope -> Grep String",
			},
			{
				"<leader>fP",
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config").options.root,
					})
				end,
				desc = "Telescope -> Find Plugin File",
			},
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
				end,
				desc = "Telescope -> Find Files",
			},
			{
				";r",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep({
						additional_args = { "--hidden" },
					})
				end,
				desc = "Telescope -> Live Grep",
			},
			{
				"\\\\",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "Telescope -> Open Buffers",
			},
			{
				";h",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
				desc = "Telescope -> Help Guide",
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
				desc = "Telescope -> Resume Previous Buffer",
			},
			{
				";s",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
				desc = "Telescope -> Treesitter Symbols (For Navigation)",
			},
			{
				"sf",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						select_buffer = true,
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = true,
						initial_mode = "normal",
					})
				end,
				desc = "Telescope -> File Browser",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = telescope.extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				path_display = { "smart" },
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			})
			opts.extensions = {
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},

	-- Todo Comments
	{
		"folke/todo-comments.nvim",
		event = "BufReadPre",
		--- @type TodoComments.Config
		opts = {
			signs = true,
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			highlight = {
				multiline = true, -- enable multine todo comments
				multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
				multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
			},
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
		},
	},

	-- Color Highlighter
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			local colorizer = require("colorizer")
			colorizer.setup({ "*" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				-- css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				-- css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "background", -- Set the display mode.
			})
		end,
	},

	-- Git
	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				-- Open blame window
				blame = "<Leader>gb",
				-- Open file/folder in git repository
				browse = "<Leader>go",
			},
		},
	},

	-- Tailwind Colorizer
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		event = "BufReadPre",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	{
		"theprimeagen/vim-be-good",
		lazy = true,
		event = "VeryLazy",
	},
}
