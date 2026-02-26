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

-- Teleport to each chest
for _, pos in ipairs(chestPositions) do
    hrp.Position = pos
    task.wait(1) -- wait for 1 second at each chest
end

-- Teleport back to starting location
hrp.Position = startingPosition
