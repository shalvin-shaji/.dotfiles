local wezterm = require("wezterm")

local theme = {}
function theme.apply_to_config(config)
	config.kde_window_background_blur = true
	config.font = wezterm.font("AgaveNerdFont")
	config.font_size = 14
end

return theme
