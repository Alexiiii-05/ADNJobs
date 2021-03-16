ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Brasseur:AAAA')
AddEventHandler('Brasseur:AAAA', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Brasseur', 'Annonce', '~s~Les Brasseur sont Disponible !', 'CHAR_BRYONY', 8)
    end
end)

RegisterServerEvent('Brasseur:BBBB')
AddEventHandler('Brasseur:BBBB', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Brasseur', 'Annonce', '~s~Les ~o~Brasseur~s~ ne sont ~r~plus Disponible !', 'CHAR_RON', 8)
    end
end)

RegisterServerEvent('Brasseur:RecolteHublon')
AddEventHandler('Brasseur:RecolteHublon', function(name, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem(name, count)
    Citizen.Wait(3000)
    xPlayer.addInventoryItem(name, count)
    Citizen.Wait(3000)
    xPlayer.addInventoryItem(name, count)
    Citizen.Wait(3000)
    xPlayer.addInventoryItem(name, count)
    Citizen.Wait(3000)
    xPlayer.addInventoryItem(name, count)
    Citizen.Wait(3000)
    xPlayer.addInventoryItem(name, count)
    Citizen.Wait(3000)
    xPlayer.addInventoryItem(name, count)
    Citizen.Wait(3000)
    xPlayer.addInventoryItem(name, count)
end)

RegisterServerEvent('Brasseur:TraitementBrune')
AddEventHandler('Brasseur:TraitementBrune', function(name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local BrasseurQuantity = xPlayer.getInventoryItem(name).count
    
    if BrasseurQuantity >= 1 then
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem(name, 1)
        xPlayer.addInventoryItem("water", 1)
    else
        TriggerClientEvent('esx:showNotification', _source, '~o~Brasseur\n~r~Tu n\'a plus de chocolat a traiter')
end
end)


RegisterServerEvent('Brasseur:VenteBrune')
AddEventHandler('Brasseur:VenteBruneBrune', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local BrasseurQuantity = xPlayer.getInventoryItem("water").count
    local reventeprix = 82

    if BrasseurQuantity >= 1 then
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
        xPlayer.removeInventoryItem("water", 3)
        xPlayer.addMoney(reventeprix)
        Citizen.Wait(3000)
    else
        TriggerClientEvent('esx:showNotification', _source, '~o~Chocolatier\n~r~Tu n\'a plus de tablette a vendre')
end
end)