theme = {}

-- Todo:  Change the $USER to yourself.
theme_dir = os.getenv("HOME") .. "/.config/awesome/themes/thrifty"
theme.theme_dir = theme_dir

theme.font          = "Tamsyn 10.5"

-- Colors
theme.bg_normal     = "#151617"
theme.bg_focus      = theme.bg_normal
theme.bg_systray    = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.fg_urgent     = "#9e6b71"
theme.fg_normal     = "#686868"
theme.fg_focus      = "#cdcfce"

-- Borders
theme.border_width  = 2
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.fg_focus
--theme.border_focus  = "#cdcfce"
theme.border_marked = "#91231c"

-- Titlebar
theme.titlebar_fg_normal = theme.fg_normal
theme.titlebar_fg_focus = theme.fg_focus
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_bg_focus = "#000000"

-- Tasklist
theme.tasklist_fg_focus = theme.fg_focus
theme.tasklist_fg_normal = "#686868"
theme.tasklist_bg_focus = theme.bg_focus
theme.tasklist_disable_icon = true

-- Gaps
theme.useless_gap_width = 10
theme.global_border_width = 0

-- Arch logo
theme.menu_dropdown = theme_dir .. "/icons/dropdown.png"

-- Menu
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

theme.wallpaper = theme_dir .. "/pattern.png"

--  Layout icons
theme.layout_floating  = theme_dir .. "/icons/floating.png"
theme.layout_uselesstile = theme_dir .. "/icons/tile.png"
theme.layout_uselessfair = theme_dir .. "/icons/fair.png"
theme.layout_bottomrightwork = theme_dir .. "/icons/bottomrightwork.png"
theme.layout_coding = theme_dir .. "/icons/coding.png"

-- Battery icons
theme.batfull = theme_dir .. "/icons/bat_full.png"
theme.bat80 = theme_dir .. "/icons/bat_80.png"
theme.bat60 = theme_dir .. "/icons/bat_60.png"
theme.bat40 = theme_dir .. "/icons/bat_40.png"
theme.batlow = theme_dir .. "/icons/bat_low.png"

-- Volume icons
theme.mute = theme_dir .. "/icons/mute.png"
theme.music = theme_dir .. "/icons/music.png"

-- Volume icons
theme.mute = theme_dir .. "/icons/vol_mute.png"
theme.volno = theme_dir .. "/icons/vol_no.png"
theme.vollow = theme_dir .. "/icons/vol_lo.png"
theme.volmed = theme_dir .. "/icons/vol_med.png"
theme.volhigh = theme_dir .. "/icons/vol_high.png"

-- For the wifi icons
theme.netoff = theme_dir .. "/icons/netoff.png"
theme.netlow = theme_dir .. "/icons/netlow.png"
theme.netmed = theme_dir .. "/icons/netmedium.png"
theme.nethigh = theme_dir .. "/icons/nethigh.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
