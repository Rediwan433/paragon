local M = {}

M.url = "https://github.com/echasnovski/mini.icons"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		MiniIconsGrey = { fg = c.fg_dim },
		MiniIconsPurple = { fg = c.magenta },
		MiniIconsBlue = { fg = c.cyan },
		MiniIconsAzure = { fg = c.info },
		MiniIconsCyan = { fg = c.teal },
		MiniIconsGreen = { fg = c.green },
		MiniIconsYellow = { fg = c.yellow },
		MiniIconsOrange = { fg = c.orange },
		MiniIconsRed = { fg = c.error },
	}
end

return M
