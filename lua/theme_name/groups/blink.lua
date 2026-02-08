local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	-- stylua: ignore
	local ret = {
        BlinkCmpDoc = { fg = c.fg, bg = c.surface },
		BlinkCmpDocBorder = { fg = c.surface, bg = c.surface },
		BlinkCmpGhostText = { fg = c.fg_dim },

		BlinkCmpKindCodeium = { fg = c.fg, bg = c.none },
		BlinkCmpKindCopilot = { fg = c.fg, bg = c.none },
		BlinkCmpKindDefault = { fg = c.fg, bg = c.none },
		BlinkCmpKindSupermaven = { fg = c.fg, bg = c.none },
		BlinkCmpKindTabNine = { fg = c.fg, bg = c.none },

		BlinkCmpLabel = { fg = c.fg_dim, bg = c.none },
		BlinkCmpLabelMatch = { fg = c.fg, bg = c.none },
		BlinkCmpMenu = { fg = c.fg, bg = c.surface },

		BlinkCmpLabelDeprecated = { fg = c.fg_dim, bg = c.none, strikethrough = true },
		BlinkCmpMenuBorder = { fg = c.surface, bg = c.surface },
		BlinkCmpSignatureHelp = { fg = c.fg, bg = c.surface },
		BlinkCmpSignatureHelpBorder = { fg = c.surface, bg = c.surface },
		BlinkCmpScrollBarThumb = { bg = c.fg_dim },
		BlinkCmpScrollBarGutter = { bg = c.overlay},
		BlinkCmpSource = { fg = c.fg_dim },
	}

	require("theme_name.groups.kinds").kinds(ret, "BlinkCmpKind%s")
	return ret
end

return M
