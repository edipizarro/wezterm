local wezterm = require("wezterm")

-- Select tab with ALT+N°
local keys = {}
for i = 1, 9 do
	-- ALT + number to activate that tab
	table.insert(keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action({ ActivateTab = i - 1 }),
	})
end

-- Move between tabs with CTRL+ALT+ { or }
table.insert(keys, { key = "{", mods = "CTRL|ALT", action = wezterm.action({ MoveTabRelative = -1 }) })
table.insert(keys, { key = "}", mods = "CTRL|ALT", action = wezterm.action({ MoveTabRelative = 1 }) })

-- Toggle full screen with F11
table.insert(keys, { key = "F11", mods = "NONE", action = "ToggleFullScreen" })

return {
	color_scheme = "Dracula (Official)",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	keys = keys,
}
