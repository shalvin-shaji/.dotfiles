local theme = {}

function theme.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha"

	config.window_background_image_hsb = {
		brightness = 0.3,
		hue = 1.0,
		saturation = 0.8,
	}
	config.window_background_opacity = 0.4
	config.kde_window_background_blur = true
end

return theme
