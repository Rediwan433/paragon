local Util = require("theme_name.util")

local M = {}

-- stylua: ignore
M.plugins = {
  ["snacks.nvim"]                   = "snacks",
}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h")

function M.get_group(name)
	---@type {get: theme_name.HighlightsFn, url: string}
	return Util.mod("theme_name.groups." .. name)
end

---@param colors theme_name.ColorScheme
---@param opts theme_name.Config
function M.get(name, colors, opts)
	local mod = M.get_group(name)
	return mod.get(colors, opts)
end

---@param colors theme_name.ColorScheme
---@param opts theme_name.Config
function M.setup(colors, opts)
	local groups = {
		base = true,
		kinds = true,
		semantic_tokens = true,
		treesitter = true,
	}

	local names = vim.tbl_keys(groups)
	table.sort(names)

	local ret = {}
	-- merge highlights
	for group in pairs(groups) do
		for k, v in pairs(M.get(group, colors, opts)) do
			ret[k] = v
		end
	end
	Util.resolve(ret)
	opts.on_highlights(ret, colors)

	return ret, groups
end

return M
