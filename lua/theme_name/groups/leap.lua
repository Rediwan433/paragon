local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		LeapLabelPrimary = { fg = c.bg, bg = c.search, bold = true },
		LeapLabelSecondary = { fg = c.bg, bg = c.match, bold = true },

		LeapMatch = { fg = c.search, underline = true, bold = true },
		LeapBackdrop = { fg = c.muted },
		LeapLabelSelected = { fg = c.bg, bg = c.cyan, bold = true },
	}
end

return M
