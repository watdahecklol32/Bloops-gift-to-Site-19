local flux_security_code;
local wait = task.wait;
local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(...: any): any
	local args: {any} = {...};
	local self: Instance = args[1];
	table.remove(args, 1);
	if not checkcaller() and not flux_security_code and self and typeof(self) == "Instance" and self.ClassName == "RemoteEvent" the'
		flux_security_code = args[1];
	end;
	return hook(...);
end));
repeat wait() until flux_security_code;
print(flux_security_code);
