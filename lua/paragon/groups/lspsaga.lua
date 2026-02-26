local M = {}

M.url = "https://github.com/nvimdev/lspsaga.nvim"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		DefinitionCount = { fg = c.purple },
		DefinitionIcon = { fg = c.cyan },
		ReferencesCount = { fg = c.purple },
		ReferencesIcon = { fg = c.cyan },
		TargetWord = { fg = c.cyan, bold = true },

		LspFloatWinBorder = { fg = opts.borders and c.overlay or c.surface },
		LspFloatWinNormal = { bg = c.surface },

		LspSagaBorderTitle = { fg = c.cyan, bold = true },
		LspSagaCodeActionBorder = { fg = c.cyan },
		LspSagaCodeActionContent = { fg = c.purple },
		LspSagaCodeActionTitle = { fg = c.info, bold = true },
		LspSagaDefPreviewBorder = { fg = c.green },
		LspSagaFinderSelection = { fg = c.search, bold = true },
		LspSagaHoverBorder = { fg = c.cyan },
		LspSagaRenameBorder = { fg = c.green },
		LspSagaSignatureHelpBorder = { fg = c.error },

		DiagnosticInformation = "DiagnosticInfo",
		DiagnosticWarning = "DiagnosticWarn",
	}
end

return M
