local M = {}

---@class theme_name.Config
---@class theme_name.Config
---@field transparent boolean
---@field terminal_colors boolean
---@field styles table
---@field on_colors fun(colors: theme_name.ColorScheme)
---@field on_highlights fun(highlights: theme_name.Highlights, colors: theme_name.ColorScheme)
M.defaults = {
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},

	---@param colors theme_name.ColorScheme
	on_colors = function(colors) end,

	---@param highlights theme_name.Highlights
	---@param colors theme_name.ColorScheme
	on_highlights = function(highlights, colors) end,
}

---@type theme_name.Config
M.options = vim.tbl_deep_extend("force", {}, M.defaults)

---@param options? theme_name.Config
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? theme_name.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

return M
