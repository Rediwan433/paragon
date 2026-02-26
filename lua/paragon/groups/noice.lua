local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@type paragon.HighlightsFn
function M.get(c)
	local ret = {
		NoiceCmdlinePopupTitleLua = { fg = c.cyan },
		NoiceCmdlineIconLua = { fg = c.cyan },
		NoiceCmdlinePopupBorderLua = { fg = c.cyan },
	}
	require("paragon.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
	return ret
end

return M
