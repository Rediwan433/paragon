local M = {}

M.url = "https://github.com/lukas-reineke/headlines.nvim"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		Headline1 = { bg = c.highlight_low },
		Headline2 = { bg = c.highlight_low },
		Headline3 = { bg = c.highlight_low },
		Headline4 = { bg = c.highlight_low },
		Headline5 = { bg = c.highlight_low },
		Headline6 = { bg = c.highlight_low },

		CodeBlock = "@markup.raw",

		Dash = "@punctuation.special.markdown",

		Quote = "@markup.link",

		Bullet = "@markup.list.markdown",
	}
end

return M
