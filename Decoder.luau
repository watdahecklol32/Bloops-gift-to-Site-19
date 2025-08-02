-- when my encryption sys so good the client can decode it
local decode_args;  decode_args = @native function(encoded: string, key: {number}): string
    local decoded: string = "";
    local encode_length: number = #encoded;
    for i: number = 1, encode_length do
        for mod: number = 0, 3 do
            if i % 4 == mod then
                local char: string = string.sub(encoded, i, i);
                local DA_NUMBER: number = key[mod + 1];
                local err: number = string.byte(char) - 32;
                local original: number = (err - DA_NUMBER) % 95 + 32;
                decoded = decoded .. string.char(original);
                break;
            end;
        end;
    end;
    return decoded;
end;
local lua_gc: {any} = getgc(true);
local FireServer;
for _,v in lua_gc do
    if type(v) == 'table' and rawget(v, "InvokeServer") and rawget(v, "FireServer") then
        FireServer = rawget(v, "FireServer");
        break;
    end;
end;
local up_values = debug.getupvalues(FireServer);
local net_encode: (any, {number}) -> string = up_values[2];
local flux_encode;
local hook; hook = hookfunction(net_encode, newlclosure(@native function(...: any): string
    local args: {any} = {...};
    if not flux_encode then
        -- warn("meow");
        flux_encode = args[2];
    end;
    return hook(...);
end));
repeat task.wait() until flux_encode;
local hook; hook = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Args: {any} = {...};
    local Self = Args[1];
    table.remove(Args, 1);
    if not checkcaller() and Self and typeof(Self) == "Instance" and getnamecallmethod() == "FireServer" or getnamecallmethod() == "InvokeServer" and Self.ClassName == "RemoteEvent" or Self.ClassName == "RemoteFunction" then
        local decoded_args = decode_args(Args[1], flux_encode);
        local remote_args = string.split(decoded_args, ",");
        for i,v in remote_args do
            print(i,v);
        end;
    end;
    return hook(...);
end));
