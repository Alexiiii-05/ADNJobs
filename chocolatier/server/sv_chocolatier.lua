ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Chocolat:AAAA')
AddEventHandler('Chocolat:AAAA', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Chocolatier', 'Annonce', '~s~Les Chocolatier sont Disponible !', 'CHAR_BRYONY', 8)
    end
end)

RegisterServerEvent('Chocolat:BBBB')
AddEventHandler('Chocolat:BBBB', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Chocolatier', 'Annonce', '~s~Les ~o~Chocolatiers~s~ ne sont ~r~plus Disponible !', 'CHAR_RON', 8)
    end
end)

RegisterServerEvent('Chocolatier:RecolteChocolat')
AddEventHandler('Chocolatier:RecolteChocolat', function(name, count)
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

RegisterServerEvent('Chocolatier:traitementablette')
AddEventHandler('Chocolatier:traitementablette', function(name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ChocolatierQuantity = xPlayer.getInventoryItem(name).count
    
    if ChocolatierQuantity >= 1 then
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
        TriggerClientEvent('esx:showNotification', _source, '~o~Chocolatier\n~r~Tu n\'a plus de chocolat a traiter')
end
end)


RegisterServerEvent('Chocolatier:VenteTablette')
AddEventHandler('Chocolatier:VenteTablette', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ChocolatierQuantity = xPlayer.getInventoryItem("water").count
    local reventeprix = 70

    if ChocolatierQuantity >= 1 then
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