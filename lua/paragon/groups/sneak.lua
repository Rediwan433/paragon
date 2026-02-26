local M = {}

M.url = "https://github.com/justinmk/vim-sneak"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		Sneak = "Search",
		SneakCurrent = "IncSearch",
		SneakScope = { bg = c.fg_dim },
	}
end

return M
