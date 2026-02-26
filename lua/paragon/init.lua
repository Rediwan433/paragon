require("paragon.types")
local config = require("paragon.config")

local M = {}

---@param opts? paragon.Config
function M.load(opts)
	opts = require("paragon.config").extend(opts)

	vim.o.background = "dark"
	return require("paragon.theme").setup(opts)
end

M.setup = config.setup

return M
