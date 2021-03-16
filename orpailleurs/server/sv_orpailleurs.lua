ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Orpailleurs:AAAA')
AddEventHandler('Orpailleurs:AAAA', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Orpailleurs', 'Annonce', '~s~Les Orpailleurs sont Disponible !', 'CHAR_BRYONY', 8)
    end
end)

RegisterServerEvent('Orpailleurs:BBBB')
AddEventHandler('Orpailleurs:BBBB', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Orpailleurs', 'Annonce', '~s~Les ~o~Orpailleurs~s~ ne sont ~r~plus Disponible !', 'CHAR_RON', 8)
    end
end)

RegisterServerEvent('Orpailleurs:RecoltePepite')
AddEventHandler('Orpailleurs:RecoltePepite', function(name, count)
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

RegisterServerEvent('Orpailleurs:TraitementCarton')
AddEventHandler('Orpailleurs:TraitementCarton', function(name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local OrpailleursQuantity = xPlayer.getInventoryItem(name).count
    
    if OrpailleursQuantity >= 1 then
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
        TriggerClientEvent('esx:showNotification', _source, '~o~Orpailleurs\n~r~Tu n\'a plus de Carton a traiter')
end
end)


RegisterServerEvent('Orpailleurs:VenteBrune')
AddEventHandler('Orpailleurs:VenteBruneBrune', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local OrpailleursQuantity = xPlayer.getInventoryItem("water").count
    local reventeprix = 82

    if OrpailleursQuantity >= 1 then
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