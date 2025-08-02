local network;
for _,v in getgc(true) do
    if type(v) == "table" and rawget(v, "InvokeServer") and rawget(v, "FireServer") then
        network = v;
        break;
    end;
end;
local Players = game:GetService("Players");
local Player = Players.LocalPlayer;
for _,v in Players:GetPlayers() do
    if v ~= Player and v.Character and v.Character:FindFirstChild("Head") then
        network:FireServer("dischargeFirearm", v.Character.Head.Position, Player:FindFirstChildOfClass("Tool"), v.Character.Head, v.Character.Head.Position)
    end;
end;
