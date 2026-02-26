local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type paragon.HighlightsFn
function M.get(c, opts)
	return {
		RenderMarkdownBullet = "@markup.list.markdown",

		RenderMarkdownDash = "@punctuation.special.markdown",

		RenderMarkdownCode = { bg = c.highlight_low },

		RenderMarkdownCodeInline = "@markup.raw.markdown_inline",

		RenderMarkdownTableHead = "@markup.link.label",
		RenderMarkdownTableRow = "@property",

		RenderMarkdownUnchecked = "@markup.list.unchecked",
		RenderMarkdownChecked = "@markup.list.checked",

		RenderMarkdownQuote = "@markup.link",

		RenderMarkdownH1 = "@markup.heading.1.markdown",
		RenderMarkdownH2 = "@markup.heading.2.markdown",
		RenderMarkdownH3 = "@markup.heading.3.markdown",
		RenderMarkdownH4 = "@markup.heading.4.markdown",
		RenderMarkdownH5 = "@markup.heading.5.markdown",
		RenderMarkdownH6 = "@markup.heading.6.markdown",

		RenderMarkdownH1Bg = { bg = c.highlight_low, fg = c.purple },
		RenderMarkdownH2Bg = { bg = c.highlight_low, fg = c.cyan },
		RenderMarkdownH3Bg = { bg = c.highlight_low, fg = c.teal },
		RenderMarkdownH4Bg = { bg = c.highlight_low, fg = c.green },
		RenderMarkdownH5Bg = { bg = c.highlight_low, fg = c.yellow },
		RenderMarkdownH6Bg = { bg = c.highlight_low, fg = c.orange },
	}
end

return M
