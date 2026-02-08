local M = {}

M.url = "https://github.com/lambdalisue/glyph-palette.vim"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		GlyphPalette1 = { fg = c.error },
		GlyphPalette2 = { fg = c.green },
		GlyphPalette3 = { fg = c.warning },
		GlyphPalette4 = { fg = c.info },
		GlyphPalette6 = { fg = c.teal },
		GlyphPalette7 = { fg = c.fg },
		GlyphPalette9 = { fg = c.error },
	}
end

return M
