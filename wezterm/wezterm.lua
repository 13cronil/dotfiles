local wezterm = require 'wezterm'
local config = {}

-- Font Configuration
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 12.0  -- Adjust to your preference (11-14 is typical)

-- Color Scheme
config.color_scheme = 'Catppuccin Mocha'  -- or try 'Dracula', 'Tokyonight'

-- Window Styling
config.window_decorations = 'RESIZE'  -- Removes title bar, keeps resize handles
config.use_fancy_tab_bar = true  -- Simpler tab bar
config.tab_bar_at_bottom = true  -- Tab bar at top (or set true for bottom)

-- Scrollback
config.scrollback_lines = 5000

-- Padding (optional, gives breathing room)
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.default_domain = 'WSL:FedoraLinux-42'

-- local wsl_domain = wezterm.target_triple:find 'windows'
-- if wsl_domain then
--   config.wsl_domains = {
--     {
--       name = 'WSL:FedoraLinux-42',
--       distribution = 'Fedora',
--     }
--   }
-- end


-- Ligatures (JetBrains Mono supports these)
config.harfbuzz_features = { 'calt=1', 'clig=1' }

return config