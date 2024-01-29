

local newTabID = multishell.launch({}, "output.lua")
multishell.setTitle(newTabID, "ms_mesystem")

local newTab2 = multishell.launch({}, "ms_mesystem.lua")
multishell.setTitle(newTab2, "ms_mesystem")