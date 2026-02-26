local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		WhichKey = { fg = c.yellow, bold = true },
		WhichKeyGroup = { fg = c.cyan },
		WhichKeyDesc = { fg = c.fg },
		WhichKeySeparator = { fg = c.muted },
		WhichKeyBorder = { fg = opts.borders and c.overlay or c.surface },
		WhichKeyValue = { fg = c.teal },
	}
end

return M
