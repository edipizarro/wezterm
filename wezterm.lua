local mouse_bindings = {}
local keys = {}
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Wezterm Config Options
config.audible_bell = "Disabled"

-- Select tab with ALT+N°
for i = 1, 9 do
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

-- Copy and paste with right click
mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(wezterm.action.ClearSelection, pane)
			else
				window:perform_action(wezterm.action.PasteFrom("Clipboard"), pane)
			end
		end),
	},
}

return {
	color_scheme = "Dracula (Official)",
	keys = keys,
	mouse_bindings = mouse_bindings,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	audible_bell = config.audible_bell,
}
