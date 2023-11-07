local function sendNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(true, false)
end

function IsPlayerInRadius(player, x, y, z, radius)
    local playerPed = GetPlayerPed(-1) 
    local playerCoords = GetEntityCoords(playerPed)
    local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, x, y, z) 
    
    return distance <= radius  
end


Citizen.CreateThread(function()
    ped = PlayerPedId()
    local heading = 0.0  

    local policeName = "s_m_y_cop_01"
    local policeHash = GetHashKey(policeName)
    RequestModel(policeHash)
    police = CreatePed(9, policeHash, -1525.0652, -2934.4646, 13.9444, heading, true, false)
    radiusAgro = 10
    isInAgro = false
    while not HasModelLoaded(policeHash) do
        Citizen.Wait(0)
    end
    while IsPedDeadOrDying(police,1) == false do
        playerPos = GetEntityCoords(ped)
        policePos = GetEntityCoords(police)
        if IsPlayerInRadius(ped,policePos.x,policePos.y,policePos.z,radiusAgro*5) then
            if isInAgro == false then
                DrawMarker(1, policePos.x,policePos.y,policePos.z - 1.0, 0, 0, 0, 0, 0, 0, radiusAgro * 2.0, radiusAgro * 2.0, 1.0, 255, 0, 0, 100, false, false, 2, nil, nil, false)
                ClearPedTasks(police)
            else
                DrawMarker(1, policePos.x,policePos.y,policePos.z - 1.0, 0, 0, 0, 0, 0, 0, radiusAgro * 2.0, radiusAgro * 2.0, 1.0, 0, 255, 0, 100, false, false, 2, nil, nil, false)
                TaskCombatPed(police, ped, 0 , 0)
            end
        end
        Citizen.Wait(1)
    end
    
end)

Citizen.CreateThread(function()
    while IsPedDeadOrDying(police,1) == false  do
        if IsPlayerInRadius(ped,policePos.x,policePos.y,policePos.z,radiusAgro*5) then
            if IsPlayerInRadius(ped,policePos.x,policePos.y,policePos.z,radiusAgro) then
                isInAgro = true
            else
                isInAgro = false
            end
        end
        Citizen.Wait(100)
    end
end)