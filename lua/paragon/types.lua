---@class paragon.Palette
---@field purple string
---@field green string
---@field orange string
---@field yellow string
---@field cyan string
---@field teal string
---@field red string
---@field muted string
---@field semantic string
---@field fg string
---@field bg string
---@field highlight_low string
---@field highlight_med string
---@field highlight_high string
---@field surface string
---@field overlay string
---@field bg_dim string
---@field fg_dim string
---@field float_dim string
---@field syntax_dim string

---@class paragon.GitColors
---@field add string
---@field delete string
---@field change string

---@class paragon.DiffColors
---@field add string
---@field change string
---@field delete string
---@field text string

---@class paragon.TerminalColors
---@field black string
---@field red string
---@field green string
---@field yellow string
---@field blue string
---@field magenta string
---@field cyan string
---@field white string
---@field bright_black string
---@field bright_red string
---@field bright_green string
---@field bright_yellow string
---@field bright_blue string
---@field bright_magenta string
---@field bright_cyan string
---@field bright_white string

---@class paragon.ColorScheme: paragon.Palette
---@field none string
---@field success string
---@field error string
---@field warning string
---@field info string
---@field hint string
---@field search string
---@field search_bg string
---@field substitute string
---@field match string
---@field title string
---@field git paragon.GitColors
---@field diff paragon.DiffColors
---@field terminal? paragon.TerminalColors

---@class paragon.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias paragon.Highlights table<string, paragon.Highlight|string>
---@alias paragon.HighlightsFn fun(colors: paragon.ColorScheme, opts:paragon.Config):paragon.Highlights

return {}
