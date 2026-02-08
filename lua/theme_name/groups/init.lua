local Util = require("theme_name.util")

local M = {}

-- stylua: ignore
M.plugins = {
  ["telescope.nvim"]                = "telescope",
  ["fzf-lua"]                       = "fzf",
  ["which-key.nvim"]                = "which-key",
  ["lazy.nvim"]                     = "lazy",
  ["gitsigns.nvim"]                 = "gitsigns",
  ["nvim-tree.lua"]                 = "nvim-tree",
  ["nvim-cmp"]                      = "cmp",
  ["trouble.nvim"]                  = "trouble",
  ["noice.nvim"]                    = "noice",
  ["bufferline.nvim"]               = "bufferline",
  ["barbar.nvim"]                   = "barbar",
  ["dashboard-nvim"]                = "dashboard",
  ["neo-tree.nvim"]                 = "neo-tree",
  ["blink.cmp"]                     = "blink",
  ["flash.nvim"]                    = "flash",
  ["aerial.nvim"]                   = "aerial",
  ["vim-sneak"]                     = "sneak",
  ["hop.nvim"]                      = "hop",
  ["leap.nvim"]                     = "leap",
  ["grug-far.nvim"]                 = "grug-far",
  ["nvim-notify"]                   = "notify",
  ["render-markdown.nvim"]          = "render-markdown",
  ["headlines.nvim"]                = "headlines",
  ["indentmini.nvim"] = "indentmini",
  ["vim-gitgutter"]                 = "gitgutter",
  ["vim-glyph-palette"]             = "glyph-palette",
  ["mini.icons"]                    = "mini_icons",
  ["lspsaga.nvim"]                  = "lspsaga",
  ["neotest"]                       = "neotest",
  ["neogit"]                        = "neogit",
  ["diffview.nvim"]                 = "diffview",
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

	for _, group in pairs(M.plugins) do
		groups[group] = true
	end

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
