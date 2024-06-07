return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
				style = "night",
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
					lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
				},
			}
		end,
	},
}
