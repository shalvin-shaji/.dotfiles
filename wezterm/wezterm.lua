local wezterm = require("wezterm")
local mouse = require("mouse")
local theme = require("theme")
local tabs = require("tabs")
local config = wezterm.config_builder()

mouse.apply_to_config(config)
theme.apply_to_config(config)
tabs.apply_to_config(config)

config.scrollback_lines = 3500

return config
