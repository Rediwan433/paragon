local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		LazyProgressDone = { bold = true, fg = c.bg },
		LazyProgressTodo = { bold = true, fg = c.orange },
	}
end

return M
