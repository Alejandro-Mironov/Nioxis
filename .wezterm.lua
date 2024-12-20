local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Set up the font you like.
-- Wezterm allows you to set up a primary font that has no icons and "fallback" to a Nerd Font with the command: font = wezterm.font_with_fallback.
config.font = wezterm.font({ -- Normal text
	family = "MesloLGS NF",
	weight = "Medium",
	harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
})

config.unicode_version = 9
config.font_size = 22

-- Enabling tabs.
config.enable_tab_bar = true
-- Allowing window rezising.
config.window_decorations = "RESIZE"

-- Enabling window transparency and blur on macOS.
config.window_background_opacity = 0.3
config.macos_window_background_blur = 100

-- Setting up the theme and customizing the background color.
config.color_scheme = "catppuccin-macchiato"
config.color_schemes = {
	["catppuccin-macchiato"] = {
		background = "#20200d",
	},
}

-- Fixing weird behaviour on macOS to alt + " " characters.
config.send_composed_key_when_left_alt_is_pressed = true
-- If only one tab is open, hide the tab bar.
config.hide_tab_bar_if_only_one_tab = true

return config
