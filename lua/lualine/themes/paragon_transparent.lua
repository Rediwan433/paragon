local colors = require("paragon.colors").setup()

local paragon = {
	normal = {
		a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.green, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
	visual = {
		a = { fg = colors.yellow, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
	replace = {
		a = { fg = colors.orange, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
	command = {
		a = { fg = colors.purple, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
	terminal = {
		a = { fg = colors.teal, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.fg_dim, bg = colors.bg },
	},
	inactive = {
		a = { fg = colors.float_dim, bg = colors.bg_dim },
		b = { fg = colors.float_dim, bg = colors.bg_dim },
		c = { fg = colors.float_dim, bg = colors.bg_dim },
	},
}

return paragon
