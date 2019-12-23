local nocliping = false

local pressingf = false
local pressingb = false
local pressingr = false
local pressingl = false

local keys = {
    forward = "Z",
    back = "S",
    left = "Q",
    right = "D"
}

function OnKeyPress(key)
    if nocliping==true then
	if key == keys.forward then
		pressingf=true
    end
    if key == keys.back then
		pressingb=true
    end
    if key == keys.right then
		pressingr=true
    end
    if key == keys.left then
		pressingl=true
    end
end
end
AddEvent("OnKeyPress", OnKeyPress)

function OnKeyRelease(key)
    if nocliping==true then
    if key == keys.forward then
		pressingf=false
    end
    if key == keys.back then
		pressingb=false
    end
    if key == keys.right then
		pressingr=false
    end
    if key == keys.left then
		pressingl=false
    end
end
end
AddEvent("OnKeyRelease", OnKeyRelease)

function reload_noc(bool)
   nocliping=bool
   nobool = not bool
   GetPlayerActor(GetPlayerId()):SetActorEnableCollision(nobool)
end
AddRemoteEvent("Setnoclip", reload_noc)


function ticknoc(DeltaS)
   if nocliping==true then
    local getcamfx, getcamfy, getcamfz = GetCameraForwardVector()
    local getcamrx, getcamry, getcamrz  = GetCameraRightVector()

    local val = 250
    getcamfx=getcamfx*val
    getcamfy=getcamfy*val
    getcamfz=getcamfz*val

    getcamrx=getcamrx*val
    getcamry=getcamry*val
    getcamrz=getcamrz*val
    local x, y, z = GetPlayerLocation()
      if pressingf==true then
        CallRemoteEvent("tp_noc" , x+getcamfx,y+getcamfy,z+getcamfz )
      end
      if pressingb==true then
        CallRemoteEvent("tp_noc" , x+getcamfx*-1,y+getcamfy*-1,z+getcamfz*-1 )
      end
      if pressingr==true then
        CallRemoteEvent("tp_noc" , x+getcamrx,y+getcamry,z+getcamrz )
      end
      if pressingl==true then
        CallRemoteEvent("tp_noc" , x+getcamrx*-1,y+getcamry*-1,z+getcamrz*-1 )
      end
   end
end
AddEvent("OnGameTick",ticknoc)