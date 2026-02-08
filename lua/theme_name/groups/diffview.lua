local M = {}

M.url = "https://github.com/sindrets/diffview.nvim"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		DiffviewFilePanelTitle = { fg = c.green, bold = true },
		DiffviewFilePanelCounter = { fg = c.fg, bold = true },
		DiffviewFilePanelFileName = { fg = c.fg },
		DiffviewFilePanelPath = { fg = c.fg_dim },
		DiffviewFilePanelInsertions = { fg = c.git.add },
		DiffviewFilePanelDeletions = { fg = c.git.delete },
		DiffviewFilePanelRootPath = { fg = c.muted },
		DiffviewFilePanelSelected = { bg = c.none, fg = c.fg, bold = true },
		DiffviewFilePanelFolderName = { fg = c.teal },

		DiffviewStatusAdded = { fg = c.git.add },
		DiffviewStatusRemoved = { fg = c.git.delete },
		DiffviewStatusModified = { fg = c.git.change },
		DiffviewStatusRenamed = { fg = c.magenta },
		DiffviewStatusUntracked = { fg = c.muted },
		DiffviewStatusIgnored = { fg = c.fg_dim },
		DiffviewStatusUnknown = { fg = c.warning },
		DiffviewStatusBroken = { fg = c.error },

		DiffviewDiffAdd = { bg = c.diff.add },
		DiffviewDiffDelete = { bg = c.diff.delete, fg = c.git.delete, nocombine = true },
		DiffviewDiffChange = { bg = c.diff.change },
		DiffviewDiffText = { bg = c.diff.text },

		DiffviewFileAdded = { fg = c.git.add },
		DiffviewFileDeleted = { fg = c.git.delete },
		DiffviewFileModified = { fg = c.git.change },
		DiffviewFileRenamed = { fg = c.magenta },

		DiffviewHash = { fg = c.yellow },
		DiffviewRevision = { fg = c.cyan, bold = true },
		DiffviewCommit = { fg = c.green },

		DiffviewFolderSign = { fg = c.cyan },
		DiffviewFolderOpen = { fg = c.cyan, bold = true },
		DiffviewFolderClosed = { fg = c.cyan },

		DiffviewNonText = { fg = c.fg_dim },
		DiffviewPrimary = { fg = c.cyan, bold = true },
		DiffviewSecondary = { fg = c.fg_dim },

		DiffviewWinSeparator = { fg = opts.transparent and c.none or c.bg },

		DiffviewSignColumn = { fg = c.fg_dim },

		DiffviewCursorLine = { bg = c.highlight_low },
	}
end

return M
