local UILib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Bero667/lib/refs/heads/main/library.lua'))()

-- Safety fallback if the library doesn't return properly
if not UILib then
    UILib = _G.UILib or getgenv().UILib
end

if not UILib then 
    warn("Library failed to load!")
    return 
end

UILib:SetMenuTitle('Kaizen | Better Experience')
UILib:SetMenuSize(Vector2.new(420, 500))
UILib:CenterMenu()

-- Visual Tab (Stays First)
local visualTab = UILib:Tab('Visual')
visualTab:Section('1')
visualTab:Section('2')

-- Misc Tab (Now Second)
local miscTab = UILib:Tab('Misc')
miscTab:Section('1')
miscTab:Section('2')

-- Combat Tab (Now Third)
local combatTab = UILib:Tab('Combat')
combatTab:Section('1')
combatTab:Section('2')

-- Settings Tab
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

task.spawn(function()
    while true do
        if not UILib then break end
        UILib:Step()
        task.wait()
    end
end)
