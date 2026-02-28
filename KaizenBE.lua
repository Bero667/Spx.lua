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

-- Visual Tab
local visualTab = UILib:Tab('Visual')
visualTab:Section('1')
visualTab:Section('2')

-- Misc Tab
local miscTab = UILib:Tab('Misc')
local miscSection1 = miscTab:Section('1')
miscTab:Section('2')

-- Chest Farm Button
local chestFarmRunning = false

miscSection1:Button('Chest Farm', function()
    -- Prevents multiple loops from running at the same time
    if chestFarmRunning then
        UILib:Notification('Chest Farm is already running!', 3)
        return
    end

    chestFarmRunning = true
    UILib:Notification('Chest Farm started!', 3)

    task.spawn(function()
        -- Your specific logic starts here
        local player = game.Players.LocalPlayer
        local hrp = player.Character.HumanoidRootPart

        -- Save starting location
        local startingPosition = hrp.Position

        -- List of chest positions
        local chestPositions = {
            Vector3.new(1888, 290, -1365),
            Vector3.new(1068, 543, 2523),
            Vector3.new(1437, 178, 3115),
            Vector3.new(507, 178, 1001),
            Vector3.new(1068, 187, -94),
            Vector3.new(4079, 109, 186),
            Vector3.new(191, 125, -1341),
            Vector3.new(1577, 127, -1225),
            Vector3.new(1358, 199, -2282),
            Vector3.new(1105, 136, -488),
            Vector3.new(77, 268, 2463),
            Vector3.new(4563, -57, -1065),
            Vector3.new(4923, 233, -909),
            Vector3.new(73, 177, 2865),
            Vector3.new(4061, 81, -1306),
            Vector3.new(1511, 171, 1616),
            Vector3.new(3358, 66, -752)
        }

        -- Teleport to each chest using .Position
        for _, pos in ipairs(chestPositions) do
            hrp.Position = pos
            task.wait(1) -- wait for 1 second at each chest
        end

        -- Teleport back to starting location
        hrp.Position = startingPosition
        -- Your specific logic ends here

        chestFarmRunning = false
        UILib:Notification('Chest Farm complete!', 3)
    end)
end)

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
