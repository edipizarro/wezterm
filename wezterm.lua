local wezterm = require("wezterm")
local keymaps = require("keymaps")
local config = wezterm.config_builder()

local mouse_bindings = {}

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

-- Select with regex using CTRL+SHIFT+SPACE
config.quick_select_patterns = { "([0-9a-zA-Z]+(?:-[0-9a-zA-Z]+)+)" }

-- Use keybindings in keymaps.lua
config.disable_default_key_bindings = true
for key, value in pairs(keymaps) do
	config[key] = value
end

-- Color scheme
config.color_scheme = "Dracula (Official)"
config.term = "xterm-256color"

-- Wezterm Config Options
config.audible_bell = "Disabled"
config.mouse_bindings = mouse_bindings
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"

-- Allow tabs to be wider to show more of the title
config.tab_max_width = 32

return config
