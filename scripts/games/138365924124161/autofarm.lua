local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local coinsFolder = workspace:WaitForChild("CoinsSetup"):WaitForChild("CoinsFolder")

local teleportDelay = 0.5 -- Seconds between teleports
local reexecutionDelay = 1 -- Seconds between script re-execution

local function teleportTo(part)
    if character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
    end
end

local function teleportCoins()
    -- Loop through coins and filter for "BigCoin" parts
    for _, coin in ipairs(coinsFolder:GetChildren()) do
        -- Check if the coin is a BasePart AND named "BigCoin"
        if coin:IsA("BasePart") and coin.Name == "BigCoin" then
            teleportTo(coin)
            wait(teleportDelay)
        end
    end

    -- Loop through coins and filter for "MediumCoin" parts
    for _, coin in ipairs(coinsFolder:GetChildren()) do
        -- Check if the coin is a BasePart AND named "MediumCoin"
        if coin:IsA("BasePart") and coin.Name == "MediumCoin" then
            teleportTo(coin)
            wait(teleportDelay)
        end
    end
end

-- Initially call the function to teleport coins
teleportCoins()

-- Re-execute the script every 10 seconds
while true do
    wait(reexecutionDelay)
    teleportCoins()
end
