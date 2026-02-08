local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@type theme_name.HighlightsFn
function M.get(c, opts)
	return {
		-- Bullets (viñetas) - linkeado a las listas de markdown
		RenderMarkdownBullet = "@markup.list.markdown",

		-- Líneas horizontales (---) - linkeado a puntuación especial
		RenderMarkdownDash = "@punctuation.special.markdown",

		-- Código en bloque - fondo sutil
		RenderMarkdownCode = { bg = c.highlight_low },

		-- Código inline - linkeado a raw markdown
		RenderMarkdownCodeInline = "@markup.raw.markdown_inline",

		-- Tablas - head linkeado a labels de links, row a property
		RenderMarkdownTableHead = "@markup.link.label",
		RenderMarkdownTableRow = "@property",

		-- Checkbox - linkeados a los estados de lista
		RenderMarkdownUnchecked = "@markup.list.unchecked",
		RenderMarkdownChecked = "@markup.list.checked",

		-- Quotes (citas) - linkeado a links
		RenderMarkdownQuote = "@markup.link",

		-- Headings - linkeados a los headings de markdown
		RenderMarkdownH1 = "@markup.heading.1.markdown",
		RenderMarkdownH2 = "@markup.heading.2.markdown",
		RenderMarkdownH3 = "@markup.heading.3.markdown",
		RenderMarkdownH4 = "@markup.heading.4.markdown",
		RenderMarkdownH5 = "@markup.heading.5.markdown",
		RenderMarkdownH6 = "@markup.heading.6.markdown",

		-- Backgrounds para los signos de heading (los #)
		RenderMarkdownH1Bg = { bg = c.highlight_low, fg = c.green },
		RenderMarkdownH2Bg = { bg = c.highlight_low, fg = c.cyan },
		RenderMarkdownH3Bg = { bg = c.highlight_low, fg = c.teal },
		RenderMarkdownH4Bg = { bg = c.highlight_low, fg = c.yellow },
		RenderMarkdownH5Bg = { bg = c.highlight_low, fg = c.orange },
		RenderMarkdownH6Bg = { bg = c.highlight_low, fg = c.magenta },
	}
end

return M
