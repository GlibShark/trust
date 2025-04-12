-- Toggle auto-farm on each script execution
getgenv().autoFarm = not (getgenv().autoFarm or false)

local hum = game.Players.LocalPlayer.Character.Humanoid

-- Auto-farm loop
spawn(function()
    while true do
        if not getgenv().autoFarm then
            hum.Health = 0
            break
        end

        local TS = game:GetService("TweenService")
        local location2 = CFrame.new(-61, 70.739624, 125)
        local location3 = CFrame.new(-55.7065125, -360.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        local location = CFrame.new(-55.7065125, 70.739624, 9492.35645, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
        local hum = game.Players.LocalPlayer.Character.Humanoid

        local tween1 = TS:Create(plr, TweenInfo.new(3), {CFrame = location2})
        if hum.Health == 0 then
            tween1:Cancel()
        else
            tween1:Play()
            wait(3)
            local tween = TS:Create(plr, TweenInfo.new(20), {CFrame = location})
            if hum.Health == 0 then
                tween:Cancel()
            else
                tween:Play()
                wait(20)
                local tween2 = TS:Create(plr, TweenInfo.new(3), {CFrame = location3})
                if hum.Health == 0 then
                    tween2:Cancel()
                else
                    tween2:Play()
                    wait(0.1)
                    wait(8)
                    workspace.ClaimRiverResultsGold:FireServer()
                    wait(10)
                end
            end
        end
    end
end)