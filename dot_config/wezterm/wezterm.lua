-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("JetBrains Mono")
-- config.color_scheme = "Catppuccin Latte"
config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "Solarized (dark) (terminal.sexy)"
-- config.color_scheme = "Solarized (light) (terminal.sexy)"
-- and finally, return the configuration to wezterm
return config
