ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(100)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

----------------------------------------------------------
------------------- Garage - Orpailleurs -----------------
----------------------------------------------------------

function spawnCar(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do Citizen.Wait(10) end
    local car = CreateVehicle(car, -1535.34, 104.71, 56.78, 46.00, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
end

local GarageOrpailleurs = false
RMenu.Add('garage', 'main', RageUI.CreateMenu("Garage Orpailleurs", "", 10,0))
RMenu:Get('garage', 'main'):SetSubtitle("Listes des véhicules")
RMenu:Get('garage', 'main'):SetRectangleBanner(255, 182, 0, 255)
RMenu:Get('garage', 'main').EnableMouse = false
RMenu:Get('garage', 'main').Closed = function()
    GarageOrpailleurs = false
end;

function OpenGarageOrpailleurs()
    if not GarageOrpailleurs then
        GarageOrpailleurs = true
        RageUI.Visible(RMenu:Get('garage', 'main'), true)
            Citizen.CreateThread(function()
                while GarageOrpailleurs do
                    Citizen.Wait(1)

			RageUI.IsVisible(RMenu:Get('garage', 'main'), true, true, true, function()
				
				
                RageUI.Separator(' ↓ Véhicule Orpailleurs ↓ ')

                RageUI.ButtonWithStyle("Véhicule de Travail", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
					if (Selected) then
						spawnCar('bison3')
						RageUI.CloseAll()
						GarageOrpailleurs = false
                    end
				end)
				
				
                RageUI.ButtonWithStyle("Véhicule de Patron", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
					if (Selected) then
						if ESX.PlayerData.job.grade_name == 'boss' then
						spawnCar('sultan')
						RageUI.CloseAll()
						GarageOrpailleurs = false
                    else
                        ESX.ShowNotification('Vous n\'avez pas accès de faire apparaitre ce genre de véhicule')
					end
                end
            end)

                end, function()
                end)
            end
        end)
	end
end

GarageOrpailleursSSSSS = {
    Garageo = {
        {pos = vector3(-1536.38, 98.29, 56.78)}
    }
}

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(GarageOrpailleursSSSSS.Garageo) do
            if #(pCoords2 - v.pos) < 1.5 then
                activerfps = true
                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'orpailleurs' then
				DrawMarker(22, -1536.38, 98.29, 56.78, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 7, 7, 170, 0, 0, 2, 3, nil, nil, 0)
                RageUI.Text({ message = "Appuyez sur ~r~E~s~ pour accèder au ~b~Garage", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    OpenGarageOrpailleurs()
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

----------------------------------------------------------
----------------- Vestiaire - Orpailleurs ----------------
----------------------------------------------------------

local VestiaireOrpailleurs = false
RMenu.Add('vestiaire', 'main', RageUI.CreateMenu("Vestiaire Orpailleurs", "Listes des Vêtements", 10,0))
RMenu:Get('vestiaire', 'main'):SetRectangleBanner(184, 105, 31, 255)
RMenu:Get('vestiaire', 'main').Closed = function()
	VestiaireOrpailleurs = false
end;

function OpenVestiaireOrpailleurs()
    if not VestiaireOrpailleurs then
        VestiaireOrpailleurs = true
        RageUI.Visible(RMenu:Get('vestiaire', 'main'), true)
            Citizen.CreateThread(function()
                while VestiaireOrpailleurs do
					Citizen.Wait(1)
					
					RageUI.IsVisible(RMenu:Get('vestiaire', 'main'), true, true, true, function()
                
						RageUI.Separator(' ↓ Vestiaire Brasseur ↓ ')
										
						RageUI.ButtonWithStyle("Remettre ses Vêtements", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered, Active, Selected)
							if (Selected) then
								ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
									ExecuteCommand("e me")
									Citizen.Wait(1400)
									TriggerEvent('skinchanger:loadSkin', skin)
								end)
							end
						end)
						
						RageUI.ButtonWithStyle("Tenue de Travail", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered, Active, Selected)
							if (Selected) then
								ExecuteCommand("e me")
								Citizen.Wait(1400)
								--MettreVetOrpailleurs()
							end
						end)
						
						
						RageUI.ButtonWithStyle("Tenue de Patron", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered, Active, Selected)
							if (Selected) then
								if ESX.PlayerData.job.grade_name == 'boss' then
								ExecuteCommand("e me")
								Citizen.Wait(1400)
								--MettreVetPatronOrpailleurs()
							end
						end
					end)
		
						end, function()
						end)
					end
				end)
			end
		end

Orpailleurs = {
	Vestiaireo = {
		{pos = vector3(-1536.88, 130.59, 57.37)}
	}
}
		
Citizen.CreateThread(function()
	while true do
			local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
			local activerfps2 = false
			local dst = GetDistanceBetweenCoords(pCoords2, true)
			for k,v in pairs(Orpailleurs.Vestiaireo) do
				if #(pCoords2 - v.pos) < 1.5 then
					activerfps2 = true
					if ESX.PlayerData.job and ESX.PlayerData.job.name == 'orpailleurs' then
					DrawMarker(22, -1536.88, 130.59, 57.37, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 7, 7, 170, 0, 0, 2, 3, nil, nil, 0)
					RageUI.Text({ message = "Appuyez sur ~r~E~s~ pour accèder au ~b~Vestiaire", time_display = 1 })
						if IsControlJustReleased(0, 38) then
							OpenVestiaireOrpailleurs()
						end
					end
				end
				if activerfps2 then
					Wait(1)
				else
					Wait(1500)
				end
			end
		end
	end)

----------------------------------------------------------
----------------- Menu F6 - Orpailleurs ------------------
----------------------------------------------------------

local Orpailleurs_menu = false
RMenu.Add('Orpailleurs_menuf6', 'main', RageUI.CreateMenu("Orpailleurs", "", 10,0))
RMenu:Get('Orpailleurs_menuf6', 'main'):SetSubtitle("~p~Menu Interactions")
RMenu:Get('Orpailleurs_menuf6', 'main'):SetRectangleBanner(88, 33, 33, 255)
RMenu:Get('Orpailleurs_menuf6', 'main').EnableMouse = false
RMenu:Get('Orpailleurs_menuf6', 'main').Closed = function()
    Orpailleurs_menu = false
end

function openOrpailleurs()
	if not Orpailleurs_menu then
		Orpailleurs_menu = true
		RageUI.Visible(RMenu:Get('Orpailleurs_menuf6', 'main'), true)
	Citizen.CreateThread(function()
		while Orpailleurs_menu do
			Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('Orpailleurs_menuf6', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Factures", nil, {RightLabel = "~o~Facturer ~s~→→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Orpailleurs', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
                            else
                            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
                                title = ('Rentrer le montant de la facture')
                            }, function(data, menu)
                
                                local amount = tonumber(data.value)
                                if amount == nil then
                                    ESX.ShowNotification('Mauvais montant')
                                else
                                    menu.close()
                                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                                    if closestPlayer == -1 or closestDistance > 3.0 then
                                        TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Orpailleurs', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
                                    else
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_orpailleurs', 'Orpailleurs', amount)
                
                                        ESX.ShowNotification('Facture envoyée')
                                    end
                
                                end
                        
                
                            end, function(data, menu)
                                menu.close()
                            end)
                        end
                    end 
                end)

                    RageUI.Separator("↓~s~ Annonces ~s~↓")

                        RageUI.ButtonWithStyle("Orpailleurs ~g~Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown10, function(_,_,s)
                            if (s) then
                                codesCooldown10 = true 
                                TriggerServerEvent('Orpailleurs:AAAA')
                                Citizen.SetTimeout(60000, function() codesCooldown10 = false end)
                            end
                        end)
            
                        RageUI.ButtonWithStyle("Orpailleurs ~r~Non-Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown11, function(_,_,s)
                            if (s) then
                                codesCooldown11 = true 
                                TriggerServerEvent('Orpailleurs:BBBB')
                                Citizen.SetTimeout(60000, function() codesCooldown11 = false end)
                            end
                        end)
                        
                end, function()
                end)
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
		Wait(5)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'orpailleurs' then
        if IsControlJustReleased(0, 167) then
			openOrpailleurs()
		end
		end
	end
end)

----------------------------------------------------------
------------------ Rangero - Orpailleurs AA ---------------
----------------------------------------------------------

function supprimer()
	GetEntityCoords(GetPlayerPed(-1), false)
	ExecuteCommand('dv')
end


local Orpailleurs = {
    Rangero = {
        {posrangero = vector3(-1535.34, 104.71, 56.78)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps3 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Orpailleurs.Rangero) do
                if #(pCoords2 - v.posrangero) < 4 then
                    activerfps3 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'orpailleurs' then
                    DrawMarker(22, v.posrangero.x, v.posrangero.y, v.posrangero.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour ranger le véhicule", time_display = 1 })
                    if IsControlJustReleased(0, 38) then     
                        supprimer()    
                    end
                end
            end
            if activerfps3 then
                Wait(1)
            else
                Wait(1500)
            end
        end
    end
end)

----------------------------------------------------------
------------------ Recolte - Orpailleurs AA --------------
----------------------------------------------------------

local Orpailleurs = {
    Recolteo = {
        {posrecolteo = vector3(-1534.75, 80.1, 56.78)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps5 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Orpailleurs.Recolteo) do
                if #(pCoords2 - v.posrecolteo) < 4 then
                    activerfps5 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'orpailleurs' then
                    DrawMarker(22, v.posrecolteo.x, v.posrecolteo.y, v.posrecolteo.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour récolter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ExecuteCommand("e mechanic")
                        Wait(5000)  
                        TriggerServerEvent("Orpailleurs:RecoltePepite", "", 1)     -- CHANGER LITEM QUE VOUS VOULEZ
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de récolter")
                        if IsControlJustReleased(0, 73) then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end
                end
            end
            if activerfps5 then
                Wait(1)
            else
                Wait(1500)
            end
        end
    end
end)

----------------------------------------------------------
------------------ Traitement Chocolatier ----------------
----------------------------------------------------------

local Orpailleurs = {
    Traitemento = {
        {postraitemento = vector3(-1528.39, 78.56, 56.78)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps6 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Orpailleurs.Traitemento) do
                if #(pCoords2 - v.postraitemento) < 2 then
                    activerfps6 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'orpailleurs' then
                    DrawMarker(22, v.postraitemento.x, v.postraitemento.y, v.postraitemento.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour traiter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de Traiter")
                        ExecuteCommand("e mechanic")
                        Wait(2500)  
                        TriggerServerEvent("Orpailleurs:TraitementCarton", "")     -- CHANGER LITEM QUE VOUS VOULEZ
                        if IsControlJustReleased(0, 73) then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end
                end
            end
            if activerfps6 then
                Wait(1)
            else
                Wait(1500)
            end
        end
    end
end) 

----------------------------------------------------------
------------------ Vente Cghn Orpailleurs  ---------------
----------------------------------------------------------

local Orpailleurs = {
    Venteo = {
        {posventeo = vector3(-1524.19, 79.1, 56.78)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps7 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Orpailleurs.Venteo) do
                if #(pCoords2 - v.posventeo) < 2 then
                    activerfps7 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'orpailleurs' then
                    DrawMarker(22, v.posventeo.x, v.posventeo.y, v.posventeo.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour vendre", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de Vendre")
                        TriggerServerEvent("Brasseur:VenteBrune", "")     -- CHANGER LITEM QUE VOUS VOULEZ
                        if IsControlJustReleased(0, 73) then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end
                end
            end
            if activerfps7 then
                Wait(1)
            else
                Wait(1500)
            end
        end
    end
end) 

local blips = {
	{title="Orpailleurs", colour=46, id=617, x = -1535.34, y = 104.71, z = 56.78},

}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.7)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end)