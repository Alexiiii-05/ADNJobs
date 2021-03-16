ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local accesshopvip = {
  'steam:1100001120b6603', -- Nom du Joueur
}

RegisterServerEvent('viceblue:giveitem')
AddEventHandler('viceblue:giveitem', function(weapon, ammo, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() >= price then
    xPlayer.removeMoney(price)
    xPlayer.addWeapon(weapon, ammo)
		    TriggerClientEvent('esx:showNotification', _source, "~o~Ammu Nation~s~\nPaiement de ~g~-$" ..price)
    else
        TriggerClientEvent('esx:showNotification', _source, "~o~Ammu Nation\n~r~Tu n'a pas assez d'argent")  
    end
end) 

function isVip(player)
  local allowed = false
  for i,id in ipairs(accesshopvip) do
      for x,pid in ipairs(GetPlayerIdentifiers(player)) do
          if string.lower(pid) == string.lower(id) then
              allowed = true
          end
      end
  end
  return allowed
  end
  
RegisterServerEvent('checkvipAccesories')
AddEventHandler('checkvipAccesories', function()
  local id = source
  if isVip(id) then
      TriggerClientEvent("setvipaccesories", source)
  end
end)

