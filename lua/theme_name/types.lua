---@class theme_name.Palette
---@field jade string
---@field ember string
---@field gild string
---@field azure string
---@field ichor string
---@field smoke string
---@field subtle string
---@field fg string
---@field bg string
---@field surface string
---@field highlight_low string
---@field highlight_med string
---@field highlight_high string
---@field overlay string
---@field magenta string
---@field purple string
---@field red string
---@field gray string

---@class theme_name.ColorScheme: theme_name.Palette
---@field none string
---@field error string
---@field warning string
---@field info string
---@field hint string
---@field diff table<string, string>
---@field terminal? table<string, string>

---@class theme_name.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@alias theme_name.Highlights table<string, theme_name.Highlight|string>
---@alias theme_name.HighlightsFn fun(colors: theme_name.ColorScheme, opts:theme_name.Config):theme_name.Highlights

return {}
