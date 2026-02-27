-- Fetch the library and ensure it's assigned to UILib
local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Bero667/lib/refs/heads/main/library.lua'))()

-- Safety Check: If UILib is still nil, try to find it in the global environment
if not UILib then
    UILib = _G.UILib or getgenv().UILib
end

-- If it's still nil after the check, the script will stop here instead of crashing
if not UILib then 
    warn("Library failed to load!")
    return 
end

UILib:SetMenuTitle('Kaizen | Better Experience')
UILib:SetMenuSize(Vector2.new(420, 500))
UILib:CenterMenu()

-- Visual Tab
local visualTab = UILib:Tab('Visual')
visualTab:Section('1')
visualTab:Section('2')

-- Combat Tab
local combatTab = UILib:Tab('Combat')
combatTab:Section('1')
combatTab:Section('2')

-- Misc Tab
local miscTab = UILib:Tab('Misc')
miscTab:Section('1')
miscTab:Section('2')

local settingsTab, menuSection, themingSection = UILib:CreateSettingsTab('Settings')

menuSection:Button('Unload Menu', function()
    UILib:Notification('Unloading...', 2)
    task.wait(1)
    UILib:Unload()
end)

-- =============================================
--  Main Loop
-- =============================================
UILib:Notification('Menu loaded! Press F1 to toggle.', 5)

-- Using task.spawn to prevent the loop from freezing the rest of your execution
task.spawn(function()
    while true do
        if not UILib then break end
        UILib:Step()
        task.wait()
    end
end)
