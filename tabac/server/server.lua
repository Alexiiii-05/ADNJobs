ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Tabac:Disponible')
AddEventHandler('Tabac:Disponible', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Tabac', 'Annonce', '~s~Les ~o~tabagistes~s~ sont ~g~Disponible !', 'CHAR_RON', 8)
    end
end)

RegisterServerEvent('Tabac:tabacNonDisponible')
AddEventHandler('Tabac:tabacNonDisponible', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Tabac', 'Annonce', '~s~Les ~o~tabagistes~s~ ne sont ~r~plus Disponible !', 'CHAR_RON', 8)
    end
end)

RegisterServerEvent('Tabac:recolte')
AddEventHandler('Tabac:recolte', function(name, count)
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

RegisterServerEvent('Tabac:traitement')
AddEventHandler('Tabac:traitement', function(name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local TabacBlondQuantity = xPlayer.getInventoryItem(name).count
    
    if TabacBlondQuantity >= 1 then
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
        TriggerClientEvent('esx:showNotification', _source, '~o~Tabac\n~r~Tu n\'a plus de tabac a traiter')
end
end)


RegisterServerEvent('Tabac:revente')
AddEventHandler('Tabac:revente', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local TabacBlondQuantity = xPlayer.getInventoryItem("water").count
    local reventeprix = 40

    if TabacBlondQuantity >= 1 then
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
        TriggerClientEvent('esx:showNotification', _source, '~o~Tabac\n~r~Tu n\'a plus de tabac a vendre')
end
end)