-- No, "Lechevalier999" they will not be adding this horrid "anti" cheat. Fix this and i'll move to more ruthless methods :3
for _,v in getgc(false) do
    if type(v) == 'function' and islclosure(v) and #debug.getupvalues(v) == 1 then
        local up_values = debug.getupvalues(v);
        if typeof(up_values[1]) == "Instance" and up_values[1]:IsA("RemoteEvent") then
            local hook; hook = hookfunction(v, newlclosure(function(arg1: string, arg2: any)
                if arg1 ~= "v3" then return; end;
                return hook(arg1, arg2);
            end));
        end;
    end;
end;
