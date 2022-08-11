-- Input Direction Lua Script v3.4
-- Author: MKDasher
-- Hacker: Eddio0141
-- Special thanks to Pannenkoek2012 and Peter Fedak for angle calculation support.
-- Also thanks to MKDasher to making the code very clean
-- Other contributors:
--	Madghostek, Xander, ShadoXFM, Lemon

PATH = debug.getinfo(1).source:sub(2):match("(.*\\)") .. "\\InputDirection_dev\\"

dofile (PATH .. "Drawing.lua")
Drawing.resizeScreen()

dofile (PATH .. "Memory.lua")
dofile (PATH .. "Settings.lua")
dofile (PATH .. "Joypad.lua")
dofile (PATH .. "Angles.lua")
dofile (PATH .. "Engine.lua")
dofile (PATH .. "Buttons.lua")
dofile (PATH .. "Input.lua")
dofile (PATH .. "Program.lua")
dofile (PATH .. "MoreMaths.lua")
dofile (PATH .. "Actions.lua")
dofile (PATH .. "Swimming.lua")

Settings.Theme = Settings.Themes.Dark -- Settings.Themes.Dark for dark mode
Settings.ShowEffectiveAngles = false -- show angles floored to the nearest multiple of 16

Program.initFrame()
Memory.UpdatePrevPos()
function main()
	Program.initFrame()
	Program.main()
	Joypad.send()
	Swimming.swim("A")
end

function drawing()
	Drawing.paint()
end

function update()
	if Input.update() then
		Drawing.paint()
	end
end

emu.atinput(main)
emu.atvi(drawing,false)
emu.atinterval(update, false)
if emu.atloadstate then
	emu.atloadstate(drawing, false)
	emu.atreset(Drawing.resizeScreen,false)
else
	print("update ur mupen")
end
