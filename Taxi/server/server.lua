ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- Annonce 


RegisterServerEvent('Taxi:Ouvert')
AddEventHandler('Taxi:Ouvert', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', '~y~Annonce Taxi', '~s~Le ~y~Taxi ~s~est désormais ~g~ouvert ~s~!', 'CHAR_TAXI', 8)
    end
end)

RegisterServerEvent('Taxi:Ferme')
AddEventHandler('Taxi:Ferme', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Taxi', '~y~Annonce Taxi', '~s~Le ~y~Taxi ~s~est désormais ~r~fermé ~s~!', 'CHAR_TAXI', 8)
    end
end)