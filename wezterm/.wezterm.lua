-- Pull in the wezterm api
local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()
local act = wezterm.action

-- Setup the shell
--if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
--       config.default_prog = { 'C:\\cygwin64\\bin\\mintty.exe' }
--end

-- Setup the config for wezterm
local config = wezterm.config_builder()
config.font = wezterm.font("JetBrainsMono Nerd Font", {weight = 'Regular'})
config.font_size = 14

-- Window decorations
config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.win32_system_backdrop = "Acrylic"
config.window_decorations = "RESIZE"
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.color_scheme = "Catppuccin Macchiato"

-- copy paste and other settings
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
	config.enable_tab_bar = true
	config.keys = {{ key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },}
	config.mouse_bindings = {
	  {
	    event = { Down = { streak = 3, button = 'Left' } },
	    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
	    mods = 'NONE',
	  },
	 {
	  event = { Down = { streak = 1, button = "Right" } },
	  mods = "NONE",
	  action = wezterm.action_callback(function(window, pane)
	   local has_selection = window:get_selection_text_for_pane(pane) ~= ""
	   if has_selection then
	    window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
	    window:perform_action(act.ClearSelection, pane)
	   else
	    window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
	   end
	  end),
	 },
	}

	-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the default when opening Wezterm
	config.default_domain = 'WSL:Ubuntu-24.04'
end

return config
