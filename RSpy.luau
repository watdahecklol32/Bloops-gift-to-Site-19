local HttpService = game:GetService("HttpService");
local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(...)
	local Args = {...};
	local self = Args[1];
	table.remove(Args, 1);
	if self and typeof(self) == "Instance" and self == HttpService and typeof(Args[1]) == "table" then
		warn("-----------");
		for i,v in Args[1] do
			print(i, "arugment", v, "type", typeof(v), "caller", getcallingscript());
		end;
		warn("-----------");
	end;
	return hook(...);
end));
