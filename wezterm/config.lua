local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply(config)
	-- detect platform
	local is_windows = wezterm.target_triple:find("windows-msvc")
	local is_linux = wezterm.target_triple:find("linux")
	local is_mac = wezterm.target_triple:find("darwin")

	-- platform-specific defaults
	if is_windows then
		config.default_domain = "wsl:fedoralinux-42"
		config.wsl_domains = {
			{
				name = "wsl:fedoralinux-42",
				distribution = "fedora",
			},
		}
	elseif is_linux then
		config.default_domain = "local"
	elseif is_mac then
		config.default_domain = "local"
	end

	-- font configuration
	config.font = wezterm.font("JetBrains Mono")
	config.font_size = 12.0 -- adjust to your preference (11-14 is typical)

	-- colour scheme
	config.color_scheme = "gruvboxdarkhard"

	-- window styling
	config.window_decorations = "NONE"
	config.use_fancy_tab_bar = true -- simpler tab bar
	config.tab_bar_at_bottom = true -- tab bar at top (or set true for bottom)

	-- scrollback
	config.scrollback_lines = 5000

	-- padding (optional, gives breathing room)
	config.window_padding = {
		left = 10,
		right = 10,
		top = 30,
		bottom = 10,
	}

	-- ligatures (jetbrains mono supports these)
	config.harfbuzz_features = { "calt=1", "clig=1" }

	-- leader key
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = {
		{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
		{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },
	}

	config.use_fancy_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_max_width = 23
	config.switch_to_last_active_tab_when_closing_tab = true

	config.max_fps = 120
	config.front_end = "WebGpu"
	config.webgpu_power_preference = "HighPerformance"
end

return M
