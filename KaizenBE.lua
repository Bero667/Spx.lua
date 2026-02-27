loadstring(game:HttpGet('https://raw.githubusercontent.com/Bero667/lib/refs/heads/main/library.lua'))()

UILib:SetMenuTitle('Kaizen | Better Experience')
UILib:SetMenuSize(Vector2.new(420, 500))
UILib:CenterMenu()

local visualTab = UILib:Tab('Visual')
visualTab:Section('Visual')
visualTab:Section('Visual')

local combatTab = UILib:Tab('Combat')
combatTab:Section('Combat')
combatTab:Section('Combat')

local miscTab = UILib:Tab('Misc')
miscTab:Section('Misc')
miscTab:Section('Misc')

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

while true do
    UILib:Step()
end