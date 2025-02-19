local ESPEnabled = false
if not _G.ESPStarted then
    _G.ESPStarted = true
    game:GetService("RunService").RenderStepped:Connect(function()
        if ESPEnabled then
            for _,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    if not v.Character.HumanoidRootPart:FindFirstChild("ESP") then
                        local ESP = Instance.new("BillboardGui", v.Character.HumanoidRootPart)
                        ESP.Name = "ESP"
                        ESP.Size = UDim2.new(4,0,5.5,0)
                        ESP.AlwaysOnTop = true
                        local TextLabel = Instance.new("TextLabel", ESP)
                        TextLabel.Text = v.Name
                        TextLabel.TextColor3 = Color3.fromRGB(255,0,0)
                        TextLabel.Size = UDim2.new(1,0,1,0)
                        TextLabel.BackgroundTransparency = 1
                    end
                    v.Character.HumanoidRootPart.ESP.Enabled = true
                end
            end
        end
    end)
end

ESPEnabled = not ESPEnabled
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "ESP",
    Text = ESPEnabled and "Enabled" or "Disabled",
    Duration = 2
})
