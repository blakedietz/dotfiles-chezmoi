-- local wezterm = require("wezterm")

-- return {
--   color_scheme = "tokyonight_moon",
--   font =
--     wezterm.font("BerkeleyMono Nerd Font", {
--     weight = "Bold",
--   })
--
--   ,
--   font_size = 17.0,
--   keys = {
--     {
--       key = "|",
--       mods = "CMD",
--       action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
--     },
--     {
--       key = "-",
--       mods = "CMD",
--       action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
--     },
--   },
-- }-- Pull in the wezterm API

local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"
config.font = wezterm.font("BerkeleyMono Nerd Font", {
	weight = "Bold",
})
config.font_size = 20.0
config.keys = {
	{
		key = "|",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{ key = "b", mods = "CMD", action = act.PaneSelect },
	-- Found this config here: https://ansidev.xyz/posts/2023-05-18-wezterm-cheatsheet
	{
		key = "R",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 60
config.window_decorations = "RESIZE"
-- Neovim zenmode
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

local mux = wezterm.mux

-- wezterm workspace configurations
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})

	local notes_tab = window:spawn_tab({ cwd = wezterm.home_dir .. "/notes" })
	notes_tab:set_title("Notes")

	local work_tree_development_tab = window:spawn_tab({
		cwd = wezterm.home_dir .. "/projects/EmpowerDelivery/scratch",
	})
	work_tree_development_tab:set_title("EmpowerDelivery/scratch")

	local work_tree_current_tab = window:spawn_tab({
		cwd = wezterm.home_dir .. "/projects/EmpowerDelivery/scratch-work-tree-current",
	})
	work_tree_current_tab:set_title("🌳: EmpowerDelivery/scratch-worktree-current")
end)

-- and finally, return the configuration to wezterm
return config
