local M = {}

M.url = "https://github.com/echasnovski/mini.icons"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		MiniIconsGrey = { fg = c.fg_dim },
		MiniIconsPurple = { fg = c.purple },
		MiniIconsBlue = { fg = c.cyan },
		MiniIconsAzure = { fg = c.cyan },
		MiniIconsCyan = { fg = c.teal },
		MiniIconsGreen = { fg = c.green },
		MiniIconsYellow = { fg = c.yellow },
		MiniIconsOrange = { fg = c.orange },
		MiniIconsRed = { fg = c.red },
	}
end

return M
