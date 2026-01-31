require("theme_name.types")
local config = require("theme_name.config")

local M = {}

---@param opts? theme_name.Config
function M.load(opts)
	opts = require("theme_name.config").extend(opts)

	vim.o.background = "dark"
	return require("theme_name.theme").setup(opts)
end

M.setup = config.setup

return M
