local M = {}

M.url = "https://github.com/folke/trouble.nvim"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		TroubleText = { fg = c.fg },
		TroubleNormal = { fg = c.fg, bg = c.surface },
		TroubleNormalNC = { fg = c.fg_dim, bg = c.surface },
		TroubleCount = { fg = c.yellow, bg = c.none },
		TroubleCode = { fg = c.semantic, bg = c.none },
	}
end

return M
