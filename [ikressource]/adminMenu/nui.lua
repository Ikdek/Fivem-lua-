local ui = false;

RegisterCommand('showuitest', function()
    ui = not ui 

    -- Ici faire cette condition est inutile, autant reprendre ce que vaut UI car il est soit true ou false.
    -- Et si il est true, alors showUI doit être true, et inversement.

    SendNUIMessage({showUI = ui; }) -- Sends a message to the js file. 
end)

RegisterKeyMapping('showuitest', 'Opens the UI', 'keyboard', 'L')

-- Ici tu vas créer un seul et unique NUI Callback 

RegisterNUICallback("nui_callback", function(args)

    -- On passe un argument "args" qui sera tout le temps sous forme d'un tableau ou objet

    -- Où args[1] sera le nom de la catégorie associée à NuiCallback
    -- Où args[2] sera le nom de la fonction dont on a besoin dans la catégorie du NuiCallback
    -- Et args[3] les data à envoyer
    -- Cette approche permet de n'avoir qu'un seul callback, et de gérer bien plus facilement & rapidement les actions à effectuer

    local category = args[1]
    local _function = args[2]
    local data = table.unpack(args[3])

    -- Le fait de venir table.unpack va permettre à, qu'importe le nombre d'arguments à envoyer côté JS, ils seront mis dans les paramètres de la fonction à utiliser.
    
    -- On va écrire les erreur ici, pour une meilleure clartée. Pas besoin de return, la fonction error() arrête automatiquement l'execution de la fonction.

    if not NuiCallback[category] then
        error("La catégorie " .. tostring(category) .. " n'existe pas dans NuiCallback")
    end

    if not NuiCallback[category][_function] or type(NuiCallback[category][_function]) ~= "function" then
        error("La fonction " .. tostring(_function) .. " n'existe pas dans NuiCallback")
    end

    -- Potentielles erreurs passées, on execute.

    NuiCallback[_function](data) 
end)

-- On initialise notre classe

local NuiCallback = {}

--[[
    /* FUNCTIONS ADMIN */
]]

-- On initialise une catégorie "AdminAction" dans la classe NuiCallback

NuiCallback.AdminAction = {}

NuiCallback.AdminAction.noclip = function()
    SetDisplay(false)
end

NuiCallback.AdminAction.heal = function()
    SetDisplay(false)
end

NuiCallback.AdminAction.god = function()
    SetDisplay(false)
end

NuiCallback.AdminAction.weapon = function()
    SetDisplay(false)
end
