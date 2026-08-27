-- variables
local terminal = "alacritty"
local fileManager = "nautilus"

-- modos scale o mirror para segundo monitor
local monitorMode = "scale"

-- Load modules
require("monitors").setup(hl, monitorMode)
require("autostart").setup(hl)
require("env").setup(hl)
require("appearance").setup(hl)
require("layouts").setup(hl)
require("input").setup(hl)
require("bindings").setup(hl, terminal, fileManager)
require("window-rules").setup(hl)
require("misc").setup(hl)

-- Noctalia theme
