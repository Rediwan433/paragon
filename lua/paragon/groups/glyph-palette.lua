local M = {}

M.url = "https://github.com/lambdalisue/glyph-palette.vim"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		GlyphPalette1 = { fg = c.red },
		GlyphPalette2 = { fg = c.green },
		GlyphPalette3 = { fg = c.orange },
		GlyphPalette4 = { fg = c.cyan },
		GlyphPalette6 = { fg = c.teal },
		GlyphPalette7 = { fg = c.fg },
		GlyphPalette9 = { fg = c.red },
	}
end

return M
