local wezterm = require("wezterm")
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
	config.hide_mouse_cursor_when_typing = true
	config.mouse_bindings = {
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = act.PasteFrom("Clipboard"),
		},
	}
end

return module
