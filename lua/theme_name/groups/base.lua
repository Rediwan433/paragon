local M = {}

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {

		Search = { bg = c.highlight_med, fg = c.fg },
		IncSearch = { bg = c.ember, fg = c.bg, bold = true },
		Substitute = { bg = c.ember, fg = c.bg },
		MatchParen = { bg = c.highlight_high, fg = c.gild, bold = true },

		DiffAdd = { bg = c.diff.add },
		DiffChange = { bg = c.diff.change },
		DiffDelete = { bg = c.diff.delete, fg = c.wyrm, nocombine = true },
		DiffText = { bg = c.diff.text },
		diffAdded = { fg = c.jade }, -- OBSOLETO: legacy lowercase
		diffRemoved = { fg = c.wyrm }, -- OBSOLETO: legacy lowercase
		diffChanged = { fg = c.ember }, -- OBSOLETO: legacy lowercase

		diffLine = { fg = c.smoke }, -- OBSOLETO: legacy lowercase
		diffFile = { fg = c.azure }, -- OBSOLETO: legacy lowercase
		diffIndexLine = { fg = c.arcana }, -- OBSOLETO: legacy lowercase
		diffOldFile = { fg = c.fg_dim, bg = c.diff.delete },
		diffNewFile = { fg = c.fg_dim, bg = c.diff.add },

		-- UI: Visual
		Visual = { bg = c.highlight_high },
		VisualNOS = { bg = c.highlight_high },
		CurSearch = "IncSearch",

		-- health (DONE)
		healthError = { fg = c.error },
		healthSuccess = { fg = c.success },
		healthWarning = { fg = c.warning },

		-- LSP: Diagnostics (DONE)
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warning },
		DiagnosticInfo = { fg = c.info },
		DiagnosticHint = { fg = c.hint },
		DiagnosticUnnecessary = { fg = c.subtle },
		DiagnosticVirtualTextError = { fg = c.error },
		DiagnosticVirtualTextWarn = { fg = c.warning },
		DiagnosticVirtualTextInfo = { fg = c.info },
		DiagnosticVirtualTextHint = { fg = c.hint },
		DiagnosticUnderlineError = { undercurl = true, sp = c.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },

		-- UI: Spell (DONE)
		SpellBad = { sp = c.error, undercurl = true },
		SpellCap = { sp = c.warning, undercurl = true },
		SpellLocal = { sp = c.info, undercurl = true },
		SpellRare = { sp = c.hint, undercurl = true },

		-- UI: Popup Menu (DONE)
		Pmenu = { bg = c.surface, fg = c.fg_dim },
		PmenuSel = { bg = c.highlight_high },
		PmenuSbar = { bg = c.overlay },
		PmenuThumb = { bg = c.subtle },
		PmenuBorder = { bg = c.surface },
		PmenuMatch = { bg = c.surface, fg = c.fg },
		PmenuMatchSel = { bg = c.highlight_high, fg = c.fg },
		WildMenu = { bg = c.surface, fg = c.fg_dim },

		-- Plugins: (DONE)
		helpExample = { fg = c.smoke }, -- OBSOLETO: rarely used
		helpCommand = { fg = c.jade }, -- OBSOLETO: rarely used

		-- Plugins: Completion (DONE)
		ComplHint = { fg = c.smoke }, -- OBSOLETO: not standard nvim API

		-- Plugins: (DONE)
		debugPC = { bg = c.overlay }, -- OBSOLETO: plugin-specific
		debugBreakpoint = { fg = c.info }, -- OBSOLETO: plugin-specific

		-- Editor: Line Numbers (DONE)
		LineNr = { fg = c.fg_dim },
		LineNrAbove = { fg = c.fg_dim },
		LineNrBelow = { fg = c.fg_dim },
		CursorLineNr = { fg = c.fg, bold = true },

		-- UI: Messages (DONE)
		ModeMsg = { fg = c.fg, bold = true },
		MsgArea = { fg = c.fg, bg = c.bg },
		MoreMsg = { fg = c.info },
		Question = { fg = c.hint },
		ErrorMsg = { fg = c.error },
		WarningMsg = { fg = c.warning },

		-- DONE
		Normal = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		Comment = { fg = c.smoke, style = opts.styles.comments },
		Constant = { fg = c.gild },
		String = { fg = c.ember },
		Character = { fg = c.gild },
		Number = { fg = c.gild },
		Boolean = { fg = c.gild },
		Float = { fg = c.gild },
		Identifier = { fg = c.fg },
		Function = { fg = c.azure },
		Statement = { fg = c.jade },
		Conditional = { fg = c.jade },
		Repeat = { fg = c.jade },
		Label = { fg = c.jade },
		Operator = { fg = c.subtle },
		Keyword = { fg = c.jade, style = opts.styles.keywords },
		Exception = { fg = c.jade },
		PreProc = { fg = c.jade },
		Include = { fg = c.jade },
		Define = { fg = c.jade },
		Macro = { fg = c.jade },
		PreCondit = { fg = c.jade },
		Type = { fg = c.ichor },
		StorageClass = { fg = c.jade },
		Structure = { fg = c.jade },
		Typedef = { fg = c.ichor },
		Special = { fg = c.gild },
		SpecialChar = { fg = c.gild },
		Delimiter = { fg = c.subtle },
		SpecialComment = { fg = c.smoke, italic = true },
		Underlined = { underline = true },
		Bold = { bold = true, fg = c.fg },
		Italic = { italic = true, fg = c.fg },
		Debug = { fg = c.gild },
		Todo = { fg = c.gild, bold = true },
		Error = { fg = c.wyrm },

		-- UI: Status / Tab (DONE)
		StatusLine = { fg = c.fg, bg = opts.transparent and c.none or c.overlay },
		StatusLineNC = { fg = c.fg_dim, bg = opts.transparent and c.none or c.overlay },
		TabLine = { bg = opts.transparent and c.none or c.overlay, fg = c.fg_dim },
		TabLineFill = { bg = opts.transparent and c.none or c.overlay },
		TabLineSel = { fg = c.azure, bg = opts.transparent and c.none or c.bg },
		Title = { fg = c.azure, bold = true },
		WinBar = "StatusLine",
		WinBarNC = "StatusLineNC",

		-- Editor: Background / Text (DONE)
		NormalNC = { fg = c.fg, bg = opts.transparent and c.none or c.bg_dim }, -- dim
		Conceal = { fg = c.fg_dim },
		NonText = { fg = c.subtle },
		SpecialKey = { fg = c.subtle },
		Whitespace = { fg = c.subtle },
		EndOfBuffer = { fg = c.fg_dim },
		Directory = { fg = c.azure },

		-- Editor: Folds (DONE)
		Folded = { fg = c.jade, bg = opts.transparent and c.none or c.bg },
		FoldColumn = { fg = c.fg_dim },

		-- UI: Floats (DONE)
		NormalFloat = { fg = c.fg, bg = c.surface },
		FloatBorder = { fg = c.surface, bg = c.surface },
		FloatTitle = { fg = c.azure, bg = c.overlay },

		-- Quickfix (DONE)
		qfFileName = { fg = c.azure },
		qfLineNr = { fg = c.fg_dim },
		QuickFixLine = { bg = c.highlight_med, bold = true },

		-- Editor: Windows (DONE)
		VertSplit = { fg = c.subtle, bg = c.none },
		WinSeparator = { fg = c.bg },
		NormalSB = { fg = c.fg, bg = opts.transparent and c.none or c.bg_dim },

		-- Editor: Columns (DONE)
		SignColumn = { fg = c.fg_dim },
		SignColumnSB = { fg = c.fg_dim }, -- OBSOLETO: plugin-specific

		-- LSP: Core (DONE)
		LspReferenceText = { bg = c.highlight_high },
		LspReferenceRead = { bg = c.highlight_high },
		LspReferenceWrite = { bg = c.highlight_high },
		LspSignatureActiveParameter = { bg = c.highlight_high, bold = true },
		LspCodeLens = { fg = c.smoke },
		LspInlayHint = { bg = c.highlight_med, fg = c.subtle },
		LspInfoBorder = { fg = c.subtle, bg = opts.transparent and c.none or c.overlay },

		-- Editor: Cursor (DONE)
		Cursor = { bg = c.fg, fg = c.bg },
		lCursor = { bg = c.fg, fg = c.bg },
		CursorIM = { bg = c.fg, fg = c.bg },
		CursorLine = { bg = c.highlight_low },
		CursorColumn = { bg = c.highlight_low },
		ColorColumn = { bg = c.highlight_low },
	}
end

return M
