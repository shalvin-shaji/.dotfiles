local wezterm = require("wezterm")
local mouse = require("mouse")
local theme = require("theme")
local tabs = require("tabs")
local config = {}

config.font = wezterm.font("JetBrains Mono Nerd Font")

config.color_scheme = "Batman"

mouse.apply_to_config(config)
theme.apply_to_config(config)
tabs.apply_to_config(config)

return config
