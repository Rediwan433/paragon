local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		-- Background base
		NotifyBackground = { fg = c.fg, bg = c.bg },

		-- DEBUG (gris/muted)
		NotifyDEBUGBody = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		NotifyDEBUGBorder = { fg = c.muted, bg = opts.transparent and c.none or c.bg },
		NotifyDEBUGIcon = { fg = c.muted },
		NotifyDEBUGTitle = { fg = c.muted, bold = true },

		-- ERROR (rojo)
		NotifyERRORBody = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		NotifyERRORBorder = { fg = c.error, bg = opts.transparent and c.none or c.bg },
		NotifyERRORIcon = { fg = c.error },
		NotifyERRORTitle = { fg = c.error, bold = true },

		-- INFO (cyan)
		NotifyINFOBody = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		NotifyINFOBorder = { fg = c.info, bg = opts.transparent and c.none or c.bg },
		NotifyINFOIcon = { fg = c.info },
		NotifyINFOTitle = { fg = c.info, bold = true },

		-- TRACE (magenta)
		NotifyTRACEBody = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		NotifyTRACEBorder = { fg = c.magenta, bg = opts.transparent and c.none or c.bg },
		NotifyTRACEIcon = { fg = c.magenta },
		NotifyTRACETitle = { fg = c.magenta, bold = true },

		-- WARN (naranja)
		NotifyWARNBody = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
		NotifyWARNBorder = { fg = c.warning, bg = opts.transparent and c.none or c.bg },
		NotifyWARNIcon = { fg = c.warning },
		NotifyWARNTitle = { fg = c.warning, bold = true },
	}
end

return M
