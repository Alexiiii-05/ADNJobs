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
------------------- Garage - Brasseur --------------------
----------------------------------------------------------

function spawnCar(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do Citizen.Wait(10) end
    local car = CreateVehicle(car, -1154.63, -1521.15, 4.34, 45.38, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
end

local GarageBrasseur = false
RMenu.Add('garage', 'main', RageUI.CreateMenu("Garage Brasseur", "", 10,0))
RMenu:Get('garage', 'main'):SetSubtitle("Listes des véhicules")
RMenu:Get('garage', 'main'):SetRectangleBanner(255, 182, 0, 255)
RMenu:Get('garage', 'main').EnableMouse = false
RMenu:Get('garage', 'main').Closed = function()
    GarageBrasseur = false
end;

function OpenGarageBrasseur()
    if not GarageBrasseur then
        GarageBrasseur = true
        RageUI.Visible(RMenu:Get('garage', 'main'), true)
            Citizen.CreateThread(function()
                while GarageBrasseur do
                    Citizen.Wait(1)

			RageUI.IsVisible(RMenu:Get('garage', 'main'), true, true, true, function()
				
				
                RageUI.Separator(' ↓ Véhicule Chocolatier ↓ ')

                RageUI.ButtonWithStyle("Véhicule de Travail", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
					if (Selected) then
						spawnCar('bison3')
						RageUI.CloseAll()
						GarageBrasseur = false
                    end
				end)
				
				
                RageUI.ButtonWithStyle("Véhicule de Patron", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
					if (Selected) then
						if ESX.PlayerData.job.grade_name == 'boss' then
						spawnCar('sultan')
						RageUI.CloseAll()
						GarageBrasseur = false
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

Brasseur = {
    Garageb = {
        {pos = vector3(-1150.81, -1519.38, 4.36)}
    }
}

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(Brasseur.Garageb) do
            if #(pCoords2 - v.pos) < 1.5 then
                activerfps = true
                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'brasseur' then
				DrawMarker(22, -1150.81, -1519.38, 4.36, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 255, 251, 0, 0, 2, 3, nil, nil, 0)
                RageUI.Text({ message = "Appuyez sur ~r~E~s~ pour accèder au ~b~Garage", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    OpenGarageChocolatier()
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
------------------ Vestiaire - Brasseur ------------------
----------------------------------------------------------

local VestiaireBrasseur = false
RMenu.Add('vestiaire', 'main', RageUI.CreateMenu("Vestiaire Brasseur", "Listes des Vêtements", 10,0))
RMenu:Get('vestiaire', 'main'):SetRectangleBanner(184, 105, 31, 255)
RMenu:Get('vestiaire', 'main').Closed = function()
	VestiaireBrasseur = false
end;

function OpenVestiaireBrasseur()
    if not VestiaireBrasseur then
        VestiaireBrasseur = true
        RageUI.Visible(RMenu:Get('vestiaire', 'main'), true)
            Citizen.CreateThread(function()
                while VestiaireBrasseur do
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
								MettreVetBrasseur()
							end
						end)
						
						
						RageUI.ButtonWithStyle("Tenue de Patron", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered, Active, Selected)
							if (Selected) then
								if ESX.PlayerData.job.grade_name == 'boss' then
								ExecuteCommand("e me")
								Citizen.Wait(1400)
								MettreVetPatronBrasseur()
							end
						end
					end)
		
						end, function()
						end)
					end
				end)
			end
		end

Brasseur = {
	Vestiairec = {
		{pos = vector3(-1144.27, -1515.91, 10.63)}
	}
}
		
Citizen.CreateThread(function()
	while true do
			local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
			local activerfps2 = false
			local dst = GetDistanceBetweenCoords(pCoords2, true)
			for k,v in pairs(Brasseur.Vestiairec) do
				if #(pCoords2 - v.pos) < 1.5 then
					activerfps2 = true
					if ESX.PlayerData.job and ESX.PlayerData.job.name == 'brasseur' then
					DrawMarker(22, -1144.27, -1515.91, 10.63, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 255, 251, 0, 0, 2, 3, nil, nil, 0)
					RageUI.Text({ message = "Appuyez sur ~r~E~s~ pour accèder au ~b~Vestiaire", time_display = 1 })
						if IsControlJustReleased(0, 38) then
							OpenVestiaireBrasseur()
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
------------------- Menu F6 - Brasseur -------------------
----------------------------------------------------------

local Brasseur_menu = false
RMenu.Add('Brasseur_menuf6', 'main', RageUI.CreateMenu("Brasseur", "", 10,0))
RMenu:Get('Brasseur_menuf6', 'main'):SetSubtitle("~p~Menu Interactions")
RMenu:Get('Brasseur_menuf6', 'main'):SetRectangleBanner(88, 33, 33, 255)
RMenu:Get('Brasseur_menuf6', 'main').EnableMouse = false
RMenu:Get('Brasseur_menuf6', 'main').Closed = function()
    Brasseur_menu = false
end

function openBrasseur()
	if not Brasseur_menu then
		Brasseur_menu = true
		RageUI.Visible(RMenu:Get('Brasseur_menuf6', 'main'), true)
	Citizen.CreateThread(function()
		while Brasseur_menu do
			Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('Brasseur_menuf6', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Factures", nil, {RightLabel = "~o~Facturer ~s~→→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Brasseur', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
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
                                        TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Brasseur', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
                                    else
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_brasseur', 'Brasseur', amount)
                
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

                        RageUI.ButtonWithStyle("Brasseur ~g~Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown10, function(_,_,s)
                            if (s) then
                                codesCooldown10 = true 
                                TriggerServerEvent('Brasseur:AAAA')
                                Citizen.SetTimeout(60000, function() codesCooldown10 = false end)
                            end
                        end)
            
                        RageUI.ButtonWithStyle("Brasseur ~r~Non-Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown11, function(_,_,s)
                            if (s) then
                                codesCooldown11 = true 
                                TriggerServerEvent('Brasseur:BBBB')
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
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'brasseur' then
        if IsControlJustReleased(0, 167) then
			openBrasseur()
		end
		end
	end
end)

----------------------------------------------------------
------------------ RangerC - Brasseur AA -----------------
----------------------------------------------------------

function supprimer()
	GetEntityCoords(GetPlayerPed(-1), false)
	ExecuteCommand('dv')
end


local Brasseur = {
    Rangerb = {
        {posrangerb = vector3(-1154.63, -1521.15, 4.34)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps3 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Brasseur.Rangerb) do
                if #(pCoords2 - v.posrangerb) < 4 then
                    activerfps3 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'brasseur' then
                    DrawMarker(22, v.posrangerb.x, v.posrangerb.y, v.posrangerb.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
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
------------------ Recolte - Brasseur AA -----------------
----------------------------------------------------------

local Brasseur = {
    Recotleb = {
        {posrecolteb = vector3(-1141.64, -1533.64, 4.33)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps5 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Brasseur.Recotleb) do
                if #(pCoords2 - v.posrecolteb) < 4 then
                    activerfps5 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'brasseur' then
                    DrawMarker(22, v.posrecolteb.x, v.posrecolteb.y, v.posrecolteb.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour récolter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ExecuteCommand("e mechanic")
                        Wait(5000)  
                        TriggerServerEvent("Brasseur:RecolteHublon", "hublon", 1)     -- CHANGER LITEM QUE VOUS VOULEZ
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

local Brasseur = {
    Traitementb = {
        {postraitementb = vector3(-1139.38, -1529.16, 4.36)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps6 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Brasseur.Traitementb) do
                if #(pCoords2 - v.postraitementb) < 2 then
                    activerfps6 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'brasseur' then
                    DrawMarker(22, v.postraitementb.x, v.postraitementb.y, v.postraitementb.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour traiter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de Traiter")
                        ExecuteCommand("e mechanic")
                        Wait(2500)  
                        TriggerServerEvent("Brasseur:TraitementBrune", "brune")     -- CHANGER LITEM QUE VOUS VOULEZ
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
------------------ Vente Cghn Brasseur Job ---------------
----------------------------------------------------------

local Brasseur = {
    Venteb = {
        {posventeb = vector3(-1153.39, -1540.27, 4.25)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps7 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Brasseur.Venteb) do
                if #(pCoords2 - v.posventeb) < 2 then
                    activerfps7 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'brasseur' then
                    DrawMarker(22, v.posventeb.x, v.posventeb.y, v.posventeb.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour vendre", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de Vendre")
                        TriggerServerEvent("Brasseur:VenteBrune", "brune")     -- CHANGER LITEM QUE VOUS VOULEZ
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
	{title="Brasseur", colour=47, id=619, x = -1157.24, y = -1526.06, z = 4.25},

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