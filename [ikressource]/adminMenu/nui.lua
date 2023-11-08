local ui = false;
RegisterCommand('showuitest', function()
    ui = not ui 
    if ui then 
        SendNUIMessage({showUI = true; }) -- Sends a message to the js file. 
    else     
        SendNUIMessage({showUI = false; }) -- Sends a message to the js file.
    end 
end)

RegisterKeyMapping('showuitest', 'Opens the UI', 'keyboard', 'L')

RegisterNUICallback("noclip", function()
    SetDisplay(false)
    print("Noclip")
end)

RegisterNUICallback("heal", function()
    SetDisplay(false)
    print("heal")
end)

RegisterNUICallback("feed", function()
    SetDisplay(false)
    print("feed")
end)

RegisterNUICallback("god", function()
    SetDisplay(false)
    print("god")
end)

RegisterNUICallback("weapon", function()
    SetDisplay(false)
    print("weapon")
end)

