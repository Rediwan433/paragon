local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		-- Base
		NeoTreeNormal = { fg = c.fg, bg = c.bg },
		NeoTreeNormalNC = { fg = c.fg_dim, bg = c.bg },
		NeoTreeEndOfBuffer = { fg = c.bg, bg = c.bg },
		NeoTreeSignColumn = { fg = c.fg_dim, bg = c.bg },
		NeoTreeStatusLine = { fg = c.fg_dim, bg = c.bg },
		NeoTreeStatusLineNC = { fg = c.fg_dim, bg = c.bg },
		NeoTreeVertSplit = { fg = c.surface, bg = c.surface },

		-- Text and files
		NeoTreeDirectoryName = { fg = c.cyan },
		NeoTreeDirectoryIcon = { fg = c.cyan },
		NeoTreeFileName = { fg = c.fg },
		NeoTreeFileNameOpened = { fg = c.fg, bold = true },
		NeoTreeFileIcon = { fg = c.fg_dim },

		-- Git status - consistent with gitsigns and other git plugins
		NeoTreeGitAdded = { fg = c.git.add },
		NeoTreeGitConflict = { fg = c.error, bold = true },
		NeoTreeGitDeleted = { fg = c.git.delete },
		NeoTreeGitIgnored = { fg = c.muted },
		NeoTreeGitModified = { fg = c.git.change },
		NeoTreeGitUnstaged = { fg = c.warning },
		NeoTreeGitUntracked = { fg = c.muted },
		NeoTreeGitStaged = { fg = c.git.add },

		-- Symbols
		NeoTreeModified = { fg = c.warning },
		NeoTreeHiddenByName = { fg = c.fg_dim },
		NeoTreeSymbolicLinkTarget = { fg = c.yellow },
		NeoTreeRootName = { fg = c.fg_dim, bold = true },
		NeoTreeIndentMarker = { fg = c.muted },
		NeoTreeExpander = { fg = c.fg_dim },

		-- Float windows
		NeoTreeFloatNormal = { fg = c.fg, bg = c.surface },
		NeoTreeFloatBorder = { fg = c.surface, bg = c.surface },
		NeoTreeFloatTitle = { fg = c.title, bg = c.overlay, bold = true },

		-- Tabs
		NeoTreeTabActive = { fg = c.cyan, bg = c.bg, bold = true },
		NeoTreeTabInactive = { fg = c.fg_dim, bg = c.bg },
		NeoTreeTabSeparatorActive = { fg = c.surface, bg = c.bg },
		NeoTreeTabSeparatorInactive = { fg = c.surface, bg = c.bg },

		-- Search
		NeoTreeFilterTerm = { fg = c.search, bold = true },
		NeoTreeDimText = { fg = c.fg_dim },

		-- Title
		NeoTreeTitleBar = { fg = c.title, bg = c.overlay, bold = true },
	}
end

return M
