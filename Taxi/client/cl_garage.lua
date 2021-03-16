ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    
    ESX.PlayerData = ESX.GetPlayerData()
    
	while actualSkin == nil do
		TriggerEvent('skinchanger:getSkin', function(skin) actualSkin = skin end)
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
     PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
end)

local vehicle = nil
local TaxiGarage = false
RMenu.Add('Taxi', 'garage', RageUI.CreateMenu("Véhicules ", "Véhicule de Service"))
RMenu:Get('Taxi', 'garage'):SetRectangleBanner(201, 192, 14, 150)
RMenu:Get('Taxi', 'garage').Closed = function()
    TaxiGarage = false
end;

function openTaxiGarage()
	if not TaxiGarage then
		TaxiGarage = true
		RageUI.Visible(RMenu:Get('Taxi', 'garage'), true)
            Citizen.CreateThread(function()
                while TaxiGarage do
                    Citizen.Wait(1)

        RageUI.IsVisible(RMenu:Get('Taxi', 'garage'), true, true, true, function()

                RageUI.ButtonWithStyle("Taxi", nil, {RightLabel = "~y~→→"}, true, function(h, a, s)
                    if s then
                        Citizen.Wait(1)
                        Citizen.Wait(1200)
                        if not ESX.Game.IsSpawnPointClear(vector3(908.9339, -183.5834, 74.20091), 6.0) then
                            local veh = ESX.Game.GetClosestVehicle(vector3(908.9339, -183.5834, 74.20091))
                            ESX.Game.DeleteVehicle(NetworkGetEntityFromNetworkId(vehicle))
                            ESX.ShowNotification("~r~Tu ne peux pas faire spawn un autre véhicule")
                        end
                        ESX.Game.SpawnVehicle(GetHashKey("taxi"), vector3(908.9339, -183.5834, 74.20091), 63.42, function(veh)
                            SetVehicleOnGroundProperly(veh)
                            vehicle = NetworkGetNetworkIdFromEntity(veh)
                            SetPedIntoVehicle(PlayerPedId(), veh, -1)
                            RageUI.CloseAll()
                            TaxiGarage = false
                        end)
                    end
                end)
    
                RageUI.ButtonWithStyle("Véhicule du Patron",nil, {RightLabel = "~y~→→"}, true, function(h, a, s)
                    if s then
                        Citizen.Wait(1)
                        Citizen.Wait(1200)
                        if not ESX.Game.IsSpawnPointClear(vector3(908.9339, -183.5834, 74.20091), 6.0) then
                            local veh = ESX.Game.GetClosestVehicle(vector3(908.9339, -183.5834, 74.20091))
                            ESX.Game.DeleteVehicle(NetworkGetEntityFromNetworkId(vehicle))
                            ESX.ShowNotification("~r~Tu ne peux pas faire spawn un autre véhicule")
                        end
                        ESX.Game.SpawnVehicle(GetHashKey("taxi"), vector3(908.9339, -183.5834, 74.20091), 63.42, function(veh)
                            SetVehicleOnGroundProperly(veh)
                            vehicle = NetworkGetNetworkIdFromEntity(veh)
                            local plate = GetVehicleNumberPlateText(vehicle)
                            SetPedIntoVehicle(PlayerPedId(), veh, -1)
                            RageUI.CloseAll()
                            TaxiGarage = false
                        end)
                    end
                 end)

                end, function()
                end)
            end
        end)
    end
end

function RangerVeh(vehicle)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local props = ESX.Game.GetVehicleProperties(vehicle)
    local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
    local engineHealth = GetVehicleEngineHealth(current)

    if IsPedInAnyVehicle(GetPlayerPed(-1), true) then 
        if engineHealth < 890 then
            ESX.ShowNotification("~r~Votre véhicule est trop abimé, vous ne pouvez pas le ranger")
        else
            ESX.Game.DeleteVehicle(vehicle)
        end
    end
end

local Taxi = {
    garage = {
        {pos = vector3(902.7262, -168.3061, 74.08255)}
    }
}

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(Taxi.garage) do
            if #(pCoords2 - v.pos) < 1.5 then
                activerfps = true
                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
                RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour accèder au garage", time_display = 1 })
                if IsControlJustReleased(0, 38) then     
                    openTaxiGarage()      
                end
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1500)
        end
    end
end
end) 


local Taxi1 = {
    garage2 = {
        {pos = vector3(913.6368, -167.2914, 74.32033)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Taxi1.garage2) do
                if #(pCoords2 - v.pos) < 1.5 then
                    activerfps = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour ranger le véhicule", time_display = 1 })
                    if IsControlJustReleased(0, 38) then     
                        RangerVeh(vehicle)      
                    end
                end
            end
            if activerfps then
                Wait(1)
            else
                Wait(1500)
            end
        end
    end
end) 