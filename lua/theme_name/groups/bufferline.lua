local M = {}

M.url = "https://github.com/akinsho/bufferline.nvim"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		BufferLineFill = { fg = c.fg_dim, bg = c.surface },
		BufferLineBackground = { fg = c.fg_dim, bg = c.surface },

		BufferLineBufferVisible = { fg = c.fg, bg = c.bg },

		BufferLineBufferSelected = { fg = c.fg, bg = c.bg },

		BufferLineSeparator = { fg = c.surface, bg = c.surface },
		BufferLineSeparatorVisible = { fg = c.surface, bg = c.bg },
		BufferLineSeparatorSelected = { fg = c.surface, bg = c.bg },

		BufferLineIndicator = { fg = c.surface, bg = c.surface },
		BufferLineIndicatorVisible = { fg = c.surface, bg = c.bg },
		BufferLineIndicatorSelected = { fg = c.cyan, bg = c.bg },

		BufferLineCloseButton = { fg = c.fg_dim, bg = c.surface },
		BufferLineCloseButtonVisible = { fg = c.fg_dim, bg = c.bg },
		BufferLineCloseButtonSelected = { fg = c.fg_dim, bg = c.bg },

		BufferLineModified = { fg = c.warning, bg = c.surface },
		BufferLineModifiedVisible = { fg = c.warning, bg = c.bg },
		BufferLineModifiedSelected = { fg = c.warning, bg = c.bg },

		BufferLineDuplicate = { fg = c.fg_dim, bg = c.surface, italic = true },
		BufferLineDuplicateVisible = { fg = c.fg, bg = c.bg, italic = true },
		BufferLineDuplicateSelected = { fg = c.fg, bg = c.bg, bold = true, italic = true },

		BufferLinePick = { fg = c.error, bg = c.surface, bold = true },
		BufferLinePickVisible = { fg = c.error, bg = c.bg, bold = true },
		BufferLinePickSelected = { fg = c.error, bg = c.bg, bold = true },

		BufferLineNumbers = { fg = c.fg_dim, bg = c.surface },
		BufferLineNumbersVisible = { fg = c.fg, bg = c.bg },
		BufferLineNumbersSelected = { fg = c.fg, bg = c.bg, bold = true },

		BufferLineDiagnostic = { fg = c.fg_dim, bg = c.surface },
		BufferLineDiagnosticVisible = { fg = c.fg, bg = c.bg },
		BufferLineDiagnosticSelected = { fg = c.fg, bg = c.bg, bold = true },
		BufferLineError = { fg = c.error, bg = c.surface },
		BufferLineErrorVisible = { fg = c.error, bg = c.bg },
		BufferLineErrorSelected = { fg = c.error, bg = c.bg, bold = true },
		BufferLineErrorDiagnostic = { fg = c.error, bg = c.surface },
		BufferLineErrorDiagnosticVisible = { fg = c.error, bg = c.bg },
		BufferLineErrorDiagnosticSelected = { fg = c.error, bg = c.bg },

		BufferLineWarning = { fg = c.warning, bg = c.surface },
		BufferLineWarningVisible = { fg = c.warning, bg = c.bg },
		BufferLineWarningSelected = { fg = c.warning, bg = c.bg, bold = true },
		BufferLineWarningDiagnostic = { fg = c.warning, bg = c.surface },
		BufferLineWarningDiagnosticVisible = { fg = c.warning, bg = c.bg },
		BufferLineWarningDiagnosticSelected = { fg = c.warning, bg = c.bg },

		BufferLineInfo = { fg = c.info, bg = c.surface },
		BufferLineInfoVisible = { fg = c.info, bg = c.bg },
		BufferLineInfoSelected = { fg = c.info, bg = c.bg, bold = true },
		BufferLineInfoDiagnostic = { fg = c.info, bg = c.surface },
		BufferLineInfoDiagnosticVisible = { fg = c.info, bg = c.bg },
		BufferLineInfoDiagnosticSelected = { fg = c.info, bg = c.bg },

		BufferLineHint = { fg = c.hint, bg = c.surface },
		BufferLineHintVisible = { fg = c.hint, bg = c.bg },
		BufferLineHintSelected = { fg = c.hint, bg = c.bg, bold = true },
		BufferLineHintDiagnostic = { fg = c.hint, bg = c.surface },
		BufferLineHintDiagnosticVisible = { fg = c.hint, bg = c.bg },
		BufferLineHintDiagnosticSelected = { fg = c.hint, bg = c.bg },

		BufferLineTab = { fg = c.fg_dim, bg = c.surface },
		BufferLineTabSelected = { fg = c.fg, bg = c.bg, bold = true },
		BufferLineTabClose = { fg = c.error, bg = c.surface },
		BufferLineTabSeparator = { fg = c.surface, bg = c.surface },
		BufferLineTabSeparatorSelected = { fg = c.surface, bg = c.bg },

		BufferLineOffsetSeparator = { fg = c.surface, bg = c.surface },
		BufferLineGroupSeparator = { fg = c.surface, bg = c.surface },
		BufferLineGroupLabel = { fg = c.fg_dim, bg = c.surface, bold = true },

		BufferLineTruncMarker = { fg = c.fg_dim, bg = c.surface },
	}
end

return M
