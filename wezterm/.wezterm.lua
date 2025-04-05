-- Pull in the wezterm api
local wezterm = require("wezterm")
local mux = wezterm.mux

-- Setup the config for wezterm
local config = wezterm.config_builder()
config.font = wezterm.font("JetBrainsMono Nerd Font")
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

return config
