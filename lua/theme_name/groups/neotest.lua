local M = {}

M.url = "https://github.com/nvim-neotest/neotest"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		-- Test Status
		NeotestPassed = { fg = c.green },
		NeotestFailed = { fg = c.error },
		NeotestRunning = { fg = c.yellow },
		NeotestSkipped = { fg = c.cyan },

		-- Test Structure
		NeotestTest = { fg = c.fg },
		NeotestNamespace = { fg = c.magenta },
		NeotestFile = { fg = c.teal },
		NeotestDir = { fg = c.cyan },
		NeotestAdapterName = { fg = c.magenta, bold = true },

		-- UI Elements
		NeotestBorder = { fg = c.overlay },
		NeotestIndent = { fg = c.muted },
		NeotestExpandMarker = { fg = c.fg_dim },
		NeotestFocused = { fg = c.yellow, bold = true },
		NeotestMarked = { fg = c.orange },
		NeotestTarget = { fg = c.warning },
		NeotestWinSelect = { fg = c.cyan, bold = true },

		-- Additional highlights
		NeotestUnknown = { fg = c.muted },
	}
end

return M
