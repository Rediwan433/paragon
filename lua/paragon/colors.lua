local M = {}

---@param opts? paragon.Config
function M.setup(opts)
	opts = require("paragon.config").extend(opts)
    -- stylua: ignore
	---@class Palette
	local palette = {
		orange  =       "#E9A96E", -- decorators, rare things 
		purple =        "#D78CF0", -- keywords 
		green  =        "#8FCF7A", -- strings  
		yellow =        "#D9CC58", -- X numbers, bools, nulls 
		teal =          "#46C2A8", -- functions, methods 
		cyan =          "#A5E9F5", -- types, builtin-types  
		red =           "#E0617A", -- X errors
		semantic =      "#BFD6D8", -- X variable attributes. 
		muted =         "#8B9C9F", -- comments
		fg =            "#E9F2F2", -- foreground
		bg =            "#181A1C", -- background

		highlight_low = "#1B1E20",
		highlight_med = "#202325",
		highlight_high = "#33383C",

		-- pure UI
		surface = "#1F2225",
		overlay = "#272C2F",

		-- dim
		bg_dim = "#131618",
		fg_dim = "#6E797E",
		float_dim = "#879297",
		syntax_dim = "#7A878A",
	}

	---@class paragon.ColorScheme: Palette
	local colors = vim.deepcopy(palette)

	colors.none = "NONE"

	colors.success = colors.green
	colors.error = colors.red
	colors.warning = colors.orange
	colors.info = colors.cyan
	colors.hint = colors.purple

	-- search & match
	colors.search = colors.yellow
	colors.search_bg = colors.highlight_med
	colors.substitute = colors.orange
	colors.match = colors.yellow
	colors.title = colors.cyan

	colors.git = {
		add = colors.green,
		delete = colors.red,
		change = colors.cyan,
	}

	colors.diff = {
		add = "#1F2B22",
		change = "#1c212b",
		delete = "#2a1c1e",
		text = "#2a3a4a",
	}

	if opts.terminal_colors then
		colors.terminal = {
			black = colors.bg,
			red = colors.red,
			green = colors.green,
			yellow = colors.yellow,
			blue = colors.cyan,
			magenta = colors.purple,
			cyan = colors.teal,
			white = colors.fg,

			bright_black = colors.highlight_high,
			bright_red = "#F1738D",
			bright_green = "#9FDC8A",
			bright_yellow = "#E6D667",
			bright_blue = "#B7F2FC",
			bright_magenta = "#E39AF8",
			bright_cyan = "#5FD3BA",
			bright_white = "#F5FAFA",
		}
	end

	return colors
end

return M
