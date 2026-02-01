local M = {}

---@param opts? theme_name.Config
function M.setup(opts)
	opts = require("theme_name.config").extend(opts)

	---@class Palette
	local palette = {
		-- structure
		jade = "#70C270", -- keywords
		wyrm = "#D04E63",
		ember = "#EE9A63", -- string
		gild = "#D6C27A", -- numbers, bools
		arcana = "#C2A9E1",
		azure = "#A7E3E6", -- function names
		ichor = "#6F9FA4", -- types
		smoke = "#566669", -- comments

		fg = "#ECF5F5",
		bg = "#15181a",
		highlight_low = "#1c2224",
		highlight_med = "#252d2f",
		highlight_high = "#303a3c",

		-- pure UI
		surface = "#171C1E",
		overlay = "#191E20",
		subtle = "#798689",

		-- dim
		bg_dim = "#0F1213",
		fg_dim = "#8A9599",
	}

	---@class theme_name.ColorScheme: Palette
	local colors = vim.deepcopy(palette)

	colors.none = "NONE"

	colors.success = colors.jade
	colors.error = colors.wyrm
	colors.warning = colors.ember
	colors.info = colors.azure
	colors.hint = colors.arcana

	colors.diff = {
		add = "#1F2B22",
		change = "#1c212b",
		delete = "#2a1c1e",
		text = "#2a3a4a",
	}

	if opts.terminal_colors then
		colors.terminal = {
			black = colors.bg,
			red = colors.wyrm,
			green = colors.jade,
			yellow = colors.gild,
			blue = colors.azure,
			magenta = colors.arcana,
			cyan = colors.ichor,
			white = colors.fg,
		}
	end

	opts.on_colors(colors)
	return colors, opts
end

return M
