local network;
for _,v in getgc(true) do
  if type(v) == "table" and rawget(v, "InvokeServer") and rawget(v, "FireServer") then
      network = v;
      break;
  end;
end;
