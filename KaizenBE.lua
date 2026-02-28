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

    if chestFarmRunning then

        UILib:Notification('Chest Farm is already running!', 3)

        return

    end



    chestFarmRunning = true

    UILib:Notification('Chest Farm started!', 3)



    task.spawn(function()

        local player = game.Players.LocalPlayer

        local hrp = player.Character.HumanoidRootPart



        local startingPosition = hrp.Position



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



        for _, pos in ipairs(chestPositions) do

            hrp.Position = pos

            task.wait(1)

        end



        hrp.Position = startingPosition

        chestFarmRunning = false

        UILib:Notification('Chest Farm complete!', 3)

    end)

end)



-- Boss Teleport Dropdown

local bossLocations = {

    Sukuna  = Vector3.new(648.80,  180.50, 3099.07),

    Uraume  = Vector3.new(43.21,   470.31, -1264.45),

    Itadori = Vector3.new(-898.35, 171.01, 2597.53),

    Eso     = Vector3.new(2098.28, 101.38, -2347.44),

    Gojo    = Vector3.new(1931.77, 157.49, 1111.18),

}

local bossChoices = {'Sukuna', 'Uraume', 'Itadori', 'Eso', 'Gojo'}



local selectedBoss = {bossChoices[1]}

local bossDropdown = miscSection1:Dropdown('Teleport to Boss', selectedBoss, bossChoices, false, function(newValue)

    selectedBoss = newValue

end)



miscSection1:Button('Teleport', function()

    local boss = selectedBoss and selectedBoss[1]

    if not boss or not bossLocations[boss] then

        UILib:Notification('No boss selected!', 3)

        return

    end



    local player = game.Players.LocalPlayer

    local hrp = player.Character and player.Character:FindFirstChild('HumanoidRootPart')

    if not hrp then

        UILib:Notification('Character not found!', 3)

        return

    end



    hrp.Position = bossLocations[boss]

    UILib:Notification('Teleported to ' .. boss .. '!', 3)

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
