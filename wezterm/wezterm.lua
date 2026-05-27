local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("config").apply(config)

return config
