local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(...: any): any?
	local args: {any} = {...};
	local self = args[1];
	table.remove(args, 1);
	if not checkcaller() and self and typeof(self) == "Instance" and self.ClassName == "RemoteEvent" and getnamecallmethod() == "FireServer" and args[2] and type(args[2]) == "string" and args[2]:find("report") then
		return;
	end;
	return hook(...);
end));
