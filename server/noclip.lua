local noclipers = {}

function noclip(ply)
    if (noclipers[tostring(ply)]==nil) then
        noclipers[tostring(ply)] = true
   CallRemoteEvent(ply, "Setnoclip" , true )
    else
        if (noclipers[tostring(ply)]==true) then
            noclipers[tostring(ply)] = false
            CallRemoteEvent(ply, "Setnoclip" , false )
        else
            noclipers[tostring(ply)] = true
             CallRemoteEvent(ply, "Setnoclip" , true )
        end
    end
end

AddCommand("noclip", noclip)

function tp_noc(ply,x,y,z)
    SetPlayerLocation(ply, x, y, z)
end

AddRemoteEvent("tp_noc", tp_noc )



