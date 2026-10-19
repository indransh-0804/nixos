local vars = require("variables")
local fn   = require("utils.functions")

hl.config({
    gestures = {
        workspace_swipe_distance                 = 700,
        workspace_swipe_cancel_ratio             = 0.15,
        workspace_swipe_min_speed_to_force       = 5,
        workspace_swipe_direction_lock           = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_create_new               = true,
    },
})

-- 3 fingers: slide the scrolling tape left/right (1:1 with your fingers)
hl.gesture({ fingers = vars.gestureFingers, direction = "horizontal", action = "scroll_move" })

-- 4 fingers: switch workspaces
hl.gesture({ fingers = vars.workspaceSwipeFingers, direction = "horizontal", action = "workspace" })

-- Modifier-gated, so they can't fire by accident
hl.gesture({ fingers = 3, direction = "up",   mods = "SUPER", scale = 1.5, action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "down", mods = "ALT", action = "close" })
hl.gesture({ fingers = 3, direction = "left", mods = "SUPER", scale = 1.5, action = "float" })

-- Move the focused window to the next/previous workspace (Lua function actions need hl.dispatch)
hl.gesture({
    fingers = vars.gestureFingersMore, direction = "right", mods = "SUPER",
    action = function() hl.dispatch(hl.dsp.window.move({ workspace = "e+1" })) end,
})
hl.gesture({
    fingers = vars.gestureFingersMore, direction = "left", mods = "SUPER",
    action = function() hl.dispatch(hl.dsp.window.move({ workspace = "e-1" })) end,
})

-- Pinch to zoom the screen (live, follows your fingers)
hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1, mode = "live" })

-- Launch something with a swipe
hl.gesture({ fingers = 4, direction = "up", action = function() hl.exec_cmd(vars.terminal) end })
