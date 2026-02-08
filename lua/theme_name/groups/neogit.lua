local M = {}

M.url = "https://github.com/NeogitOrg/neogit"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		-- Branches & Remotes
		NeogitBranch = { fg = c.git.delete, bold = true },
		NeogitBranchHead = { fg = c.git.delete, bold = true },
		NeogitRemote = { fg = c.cyan },
		NeogitRemoteBranch = { fg = c.cyan },
		NeogitRemoteBranchHead = { fg = c.cyan, bold = true },

		-- HEAD & Tag references
		NeogitHEAD = { fg = c.yellow, bold = true },
		NeogitHEADLabel = { fg = c.yellow, bold = true },
		NeogitTag = { fg = c.orange },
		NeogitTagName = { fg = c.orange },
		NeogitTagDistance = { fg = c.fg_dim },

		-- Commit references
		NeogitCommitViewHeader = { fg = c.green, bold = true },
		NeogitObjectId = { fg = c.fg_dim },
		NeogitCommitMessage = { fg = c.fg },
		NeogitCommitMessageHighlight = { fg = c.fg, bold = true },

		-- Section headers
		NeogitSectionHeader = { fg = c.green, bold = true },
		NeogitSectionHeaderCount = { fg = c.green },

		-- File status
		NeogitChangeAdded = { fg = c.git.add },
		NeogitChangeModified = { fg = c.git.change },
		NeogitChangeDeleted = { fg = c.git.delete },
		NeogitChangeRenamed = { fg = c.magenta },
		NeogitChangeUpdated = { fg = c.warning },
		NeogitChangeCopied = { fg = c.teal },

		-- Diff highlights
		NeogitDiffContext = { fg = c.fg_dim },
		NeogitDiffContextHighlight = { bg = c.highlight_low, fg = c.fg },

		-- Hunk headers
		NeogitHunkHeader = { bg = c.surface, fg = c.fg_dim },
		NeogitHunkHeaderHighlight = { bg = c.highlight_med, fg = c.cyan, bold = true },
		NeogitHunkHeaderCursor = { bg = c.highlight_high, fg = c.cyan, bold = true },

		-- Status indicators
		NeogitStaged = { fg = c.git.add, bold = true },
		NeogitUnstaged = { fg = c.warning, bold = true },
		NeogitUntracked = { fg = c.muted },
		NeogitConflict = { fg = c.error, bold = true },
		NeogitUnmergedInto = { fg = c.error },
		NeogitUnpulledFrom = { fg = c.hint },
		NeogitRebasing = { fg = c.warning, bold = true },
		NeogitPicking = { fg = c.warning, bold = true },
		NeogitReverting = { fg = c.warning, bold = true },

		-- Command history & log
		NeogitCommandText = { fg = c.fg },
		NeogitCommandCodeNormal = { fg = c.green },
		NeogitCommandCodeError = { fg = c.error },
		NeogitCommandTime = { fg = c.fg_dim },
		NeogitLogViewHeader = { fg = c.green, bold = true },

		-- Notifications
		NeogitNotificationInfo = { fg = c.info },
		NeogitNotificationWarning = { fg = c.warning },
		NeogitNotificationError = { fg = c.error },

		-- Popups
		NeogitPopupSectionTitle = { fg = c.green, bold = true },
		NeogitPopupSwitchKey = { fg = c.yellow },
		NeogitPopupSwitchEnabled = { fg = c.green },
		NeogitPopupSwitchDisabled = { fg = c.fg_dim },
		NeogitPopupOptionKey = { fg = c.orange },
		NeogitPopupOptionEnabled = { fg = c.green },
		NeogitPopupOptionDisabled = { fg = c.fg_dim },
		NeogitPopupActionKey = { fg = c.cyan },
		NeogitPopupActionDisabled = { fg = c.fg_dim },
		NeogitPopupActionHighlight = { fg = c.magenta, bold = true },
		NeogitPopupConfigKey = { fg = c.teal },
		NeogitPopupConfigEnabled = { fg = c.green },
		NeogitPopupConfigDisabled = { fg = c.fg_dim },

		-- Graph visualization
		NeogitGraphRed = { fg = c.error },
		NeogitGraphGreen = { fg = c.git.add },
		NeogitGraphYellow = { fg = c.yellow },
		NeogitGraphBlue = { fg = c.cyan },
		NeogitGraphPurple = { fg = c.magenta },
		NeogitGraphCyan = { fg = c.teal },
		NeogitGraphWhite = { fg = c.fg },
		NeogitGraphGray = { fg = c.fg_dim },
		NeogitGraphBoldRed = { fg = c.error, bold = true },
		NeogitGraphBoldGreen = { fg = c.git.add, bold = true },
		NeogitGraphBoldYellow = { fg = c.yellow, bold = true },
		NeogitGraphBoldBlue = { fg = c.cyan, bold = true },
		NeogitGraphBoldPurple = { fg = c.magenta, bold = true },
		NeogitGraphBoldCyan = { fg = c.teal, bold = true },
		NeogitGraphBoldWhite = { fg = c.fg, bold = true },

		-- UI Elements
		NeogitFloatHeader = { bg = c.surface, fg = c.fg, bold = true },
		NeogitFloatHeaderHighlight = { bg = c.highlight_med, fg = c.cyan, bold = true },
		NeogitFloatFooter = { bg = c.surface, fg = c.fg_dim },
		NeogitCommitSelectAction = { fg = c.yellow, bold = true },
		NeogitCommitViewDescription = { fg = c.fg_dim, italic = true },
		NeogitRebaseDone = { fg = c.muted },
	}
end

return M
