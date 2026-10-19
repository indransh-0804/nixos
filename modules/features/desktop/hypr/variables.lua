local scheme = require("scheme.default")

return {
    ------------------
    ---- HYPRLAND ----
    ------------------

    -- Apps
    terminal                   = "wezterm",
    browser                    = "firefox",
    editor                     = "nvim",
    fileExplorer               = "nemo",
    audioSettings              = "pavucontrol",

    -- Screenshot (hyprshot)
    screenshotCmd              = "hyprshot -m output -o ~/Pictures/Screenshots",
    screenshotFreezeCmd        = "hyprshot -m region --freeze -o ~/Pictures/Screenshots",
    screenshotRegionCmd        = "hyprshot -m region -o ~/Pictures/Screenshots",
    -- Media player
    playerCmd                  = "playerctl",

    -- Brightness
    brightnessCmd              = "brightnessctl",
    brightnessStep             = 5,                    -- percent per key press
    kbdBacklightDevice         = "*kbd_backlight*",    -- check with `brightnessctl --list`
    kbdBacklightStep           = 1,                    -- raw levels, most keyboards only have 2-4

    -- Touchpad
    touchpadDisableTyping      = true,
    touchpadScrollFactor       = 0.3,
    gestureFingers             = 3,
    workspaceSwipeFingers      = 4,
    gestureFingersMore         = 4,

    -- Blur
    blurEnabled                = true,
    blurSpecialWs              = false,
    blurPopups                 = true,
    blurInputMethods           = true,
    blurSize                   = 6,
    blurPasses                 = 2,
    blurXray                   = false,

    -- Shadow
    shadowEnabled              = true,
    shadowRange                = 15,
    shadowRenderPower          = 4,
    shadowColour               = "rgba(" .. scheme.inversePrimary .. "10)",

    -- Gaps
    workspaceGaps              = 8,
    windowGapsIn               = 2,
    windowGapsOut              = 4,
    singleWindowGapsOut        = 6,

    -- Window styling
    windowOpacity              = 0.85,
    windowRounding             = 16,
    windowRoundingPower        = 2,
    windowBorderSize           = 1,
    activeWindowBorderColour   = "rgba(" .. scheme.primary .. "e6)",
    inactiveWindowBorderColour = "rgba(" .. scheme.onSurfaceVariant .. "11)",

    -- Misc
    volumeStep                 = 10,
    volumeMax                  = 100,
    cursorTheme                = "sweet-cursors",
    cursorSize                 = 24,
    sleepGestureCmd            = "systemctl suspend-then-hibernate",

    ------------------
    ---- KEYBINDS ----
    ------------------

    -- Modifier only, the actual binds will be mod + 0-9. These should be strings and not arrays.
    kbGoToWs                   = "SUPER",
    kbGoToWsGroup              = "CTRL + SUPER",
    kbMoveWinToWs              = "SUPER + ALT",
    kbMoveWinToWsGroup         = "CTRL + SUPER + ALT",

    -- All the following binds can be either an array of binds to bind multiple keys, or a single string.

    -- Workspaces
    kbMoveWinToWsSpecial       = { "SUPER + ALT + S", "CTRL + SUPER + SHIFT + Up" },
    kbMoveWinFromWsSpecial     = "CTRL + SUPER + SHIFT + Down",
    kbMoveWinToWsNext          = { "SUPER + ALT + mouse_down", "SUPER + ALT + Page_Down", "CTRL + SUPER + SHIFT + Right" },
    kbMoveWinToWsPrev          = { "SUPER + ALT + mouse_up", "SUPER + ALT + Page_Up", "CTRL + SUPER + SHIFT + Left" },
    kbNextWs                   = { "SUPER + mouse_down", "CTRL + SUPER + Right", "SUPER + Page_Down" },
    kbPrevWs                   = { "SUPER + mouse_up", "CTRL + SUPER + Left", "SUPER + Page_Up" },
    kbNextWsGroup              = "CTRL + SUPER + mouse_down",
    kbPrevWsGroup              = "CTRL + SUPER + mouse_up",

    -- Window Group
    kbWindowCycleNext          = "ALT + TAB",
    kbWindowCyclePrev          = "SHIFT + ALT + TAB",
    kbWindowGroupCycleNext     = "CTRL + ALT + TAB",
    kbWindowGroupCyclePrev     = "CTRL + SHIFT + ALT + TAB",
    kbUngroup                  = "SUPER + U",
    kbToggleGroup              = "SUPER + Comma",
    kbGroupLockActive          = "SUPER + SHIFT + Comma",

    -- Window Actions
    kbWindowDecreaseWidth      = { "SUPER + Minus", "SUPER + ALT + Left" },
    kbWindowIncreaseWidth      = { "SUPER + Equal", "SUPER + ALT + Right" },
    kbWindowDecreaseHeight     = { "SUPER + SHIFT + Minus", "SUPER + ALT + Up" },
    kbWindowIncreaseHeight     = { "SUPER + SHIFT + Equal", "SUPER + ALT + Down" },

    kbMoveWindow               = "SUPER + Z",
    kbResizeWindow             = "SUPER + X",
    kbPinWindow                = "SUPER + P",
    kbWindowFullscreen         = "SUPER + A",
    kbWindowBorderedFullscreen = "SUPER + ALT + A",
    kbToggleWindowFloating     = "SUPER + ALT + Space",
    kbCloseWindow              = "SUPER + ESCAPE",

    -- Special workspaces toggles
    kbSpecialWs                = "SUPER + S",
    kbMusicWs                  = "SUPER + M",
    kbCommunicationWs          = "SUPER + D",
    kbTodoWs                   = "SUPER + R",

    -- Scrolling layout
    kbScrollLeft               = { "SUPER + bracketleft", "SUPER + SHIFT + mouse_up" },
    kbScrollRight              = { "SUPER + bracketright", "SUPER + SHIFT + mouse_down" },
    kbSwapColLeft              = "SUPER + SHIFT + bracketleft",
    kbSwapColRight             = "SUPER + SHIFT + bracketright",
    kbColWidthNext             = "SUPER + Period",
    kbColWidthPrev             = "SUPER + SHIFT + Period",
    kbConsumeWindow            = "SUPER + I",
    kbExpelWindow              = "SUPER + O",
    kbFitAll                   = "SUPER + SHIFT + Slash",

    -- Apps
    kbTerminal                 = "SUPER + RETURN",
    kbBrowser                  = "SUPER + B",
    kbEditor                   = "SUPER + E",
    kbFileExplorer             = "SUPER + F",
    kbAudioSettings            = "CTRL + ALT + V",

    -- Screenshots
    kbScreenshot               = "SHIFT + Print",
    kbScreenshotFreeze         = "Print",

    -- Utilities
    kbColorPicker              = "SUPER + SHIFT + C",

    -- Brightness
    kbBrightnessUp             = "XF86MonBrightnessUp",
    kbBrightnessDown           = "XF86MonBrightnessDown",

    -- Keyboard backlight
    kbKbdBacklightUp           = "XF86KbdBrightnessUp",
    kbKbdBacklightDown         = "XF86KbdBrightnessDown",

    -- Misc
    kbSleep                    = "SUPER + SHIFT + L",

    -- Clipboard
    kbClipboardPasteLatest     = "CTRL + SHIFT + ALT + V",
}
