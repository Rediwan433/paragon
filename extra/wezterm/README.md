# WezTerm
Paragon theme for WezTerm terminal.

Add to your `wezterm.lua`
```lua
    local wezterm = require 'wezterm'
    local config = {}
    if wezterm.config_builder then
      config = wezterm.config_builder()
    end

    config.color_scheme_dirs = { '/path/to/paragon' }
    config.color_scheme = 'Paragon'

    return config
```
