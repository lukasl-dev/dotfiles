local wezterm = require "wezterm"
local platform = require "utils.platform"

local config = wezterm.config_builder()

-- ======================================================================
--
-- General
--
-- ======================================================================

config.automatically_reload_config = true

config.default_prog = platform.dependent {
  { "bash" },
  windows = { "powershell" },
}

-- ======================================================================
--
-- Appearance
--
-- ======================================================================

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font "JetBrains Mono"

-- Window
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Scrollbar
config.enable_scroll_bar = true

-- Tab Bar
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- ======================================================================
--
-- Key Mappings
--
-- ======================================================================

config.keys = {}

-- Adds a new key assignment to the configuration.
-- @param key table: The key assignment to add.
-- @usage keymap { key = "t", mods = "CTRL", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } }
local function keymap(key)
  table.insert(config.keys, key)
end

return config
