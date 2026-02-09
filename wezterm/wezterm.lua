local wezterm = require("wezterm")
local config = {}

-- Detect platform
local is_windows = wezterm.target_triple:find("windows-msvc")
local is_linux = wezterm.target_triple:find("linux")
local is_mac = wezterm.target_triple:find("darwin")

-- Platform-specific defaults
if is_windows then
	config.default_domain = "WSL:FedoraLinux-42"
	config.wsl_domains = {
		{
			name = "WSL:FedoraLinux-42",
			distribution = "Fedora",
		},
	}
elseif is_linux then
	config.default_domain = "local"
elseif is_mac then
	config.default_domain = "local"
end

-- Font Configuration
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0 -- Adjust to your preference (11-14 is typical)

-- Color Scheme
config.color_scheme = "Catppuccin Mocha" -- or try 'Dracula', 'Tokyonight'

-- Window Styling
config.window_decorations = "RESIZE" -- Removes title bar, keeps resize handles
config.use_fancy_tab_bar = true -- Simpler tab bar
config.tab_bar_at_bottom = true -- Tab bar at top (or set true for bottom)

-- Scrollback
config.scrollback_lines = 5000

-- Padding (optional, gives breathing room)
config.window_padding = {
	left = 10,
	right = 10,
	top = 30,
	bottom = 10,
}

-- Ligatures (JetBrains Mono supports these)
config.harfbuzz_features = { "calt=1", "clig=1" }

return config
