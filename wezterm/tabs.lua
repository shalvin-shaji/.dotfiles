local tabs_config = {}

function tabs_config.apply_to_config(config)
	config.inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	}
end

return tabs_config
