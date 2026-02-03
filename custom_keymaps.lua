local wezterm = require("wezterm")
local act = wezterm.action

-- Custom key bindings
local keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	-- Shift+Enter to open a new line
	{ key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n") },

	-- Change tabs with Option+Up/Down
	{ key = "DownArrow", mods = "OPT", action = act.ActivateTabRelative(1) },
	{ key = "UpArrow", mods = "OPT", action = act.ActivateTabRelative(-1) },

	-- Change panes with Cmd+Up/Down
	{ key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CMD", action = act.ActivatePaneDirection("Left") },
}

-- Select tab with ALT+N°
for i = 1, 9 do
	table.insert(keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action({ ActivateTab = i - 1 }),
	})
end

-- Toggle full screen with F11
table.insert(keys, { key = "F11", mods = "NONE", action = "ToggleFullScreen" })
table.insert(keys, { key = "F11", mods = "CMD", action = "ToggleFullScreen" })

return keys
