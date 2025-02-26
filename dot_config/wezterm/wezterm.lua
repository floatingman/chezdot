-- Pull in the wezterm API
local wezterm = require("wezterm")
local time = wezterm.time.now()
local sun_times = time:sun_times(36.16, -86.78)
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrains Mono")
-- config.color_scheme = "Catppuccin Latte"
-- config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "AdventureTime"
-- config.color_scheme = "Solarized (light) (terminal.sexy)"
-- and finally, return the configuration to wezterm

if sun_times.up then
	-- Apply light theme
	config.color_scheme = "Catppuccin Latte"
	-- config.color_scheme = "AdventureTime"
else
	-- Apply dark theme
	config.color_scheme = "Catppuccin Macchiato"
	-- config.color_scheme = "Solarized Dark"
end

return config
