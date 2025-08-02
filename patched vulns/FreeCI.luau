
local gc = getgc(true);
local network;

for _,Table in next, gc do
    if type(Table) == 'table' and rawget(Table, "FireServer") and rawget(Table, "InvokeServer") then
        network = Table;
        break;
    end;
end;

network:InvokeServer("changeTeam", "Chaos Insurgency")
