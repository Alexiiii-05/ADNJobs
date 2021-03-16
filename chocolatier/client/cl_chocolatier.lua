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
------------------ Garage Chocolatier --------------------
----------------------------------------------------------

function spawnCar(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do Citizen.Wait(10) end
    local car = CreateVehicle(car, 423.82, 6519.83, 27.67, 4.54, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
end

local GarageChocolatier = false
RMenu.Add('garage', 'main', RageUI.CreateMenu("Garage Chocolatier", "", 10,0))
RMenu:Get('garage', 'main'):SetSubtitle("Listes des véhicules")
RMenu:Get('garage', 'main'):SetRectangleBanner(74, 41, 207, 255)
RMenu:Get('garage', 'main').EnableMouse = false
RMenu:Get('garage', 'main').Closed = function()
    GarageChocolatier = false
end;

function OpenGarageChocolatier()
    if not GarageChocolatier then
        GarageChocolatier = true
        RageUI.Visible(RMenu:Get('garage', 'main'), true)
            Citizen.CreateThread(function()
                while GarageChocolatier do
                    Citizen.Wait(1)

			RageUI.IsVisible(RMenu:Get('garage', 'main'), true, true, true, function()
				
				
                RageUI.Separator(' ↓ Véhicule Chocolatier ↓ ')

                RageUI.ButtonWithStyle("Véhicule de Travail", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
					if (Selected) then
						spawnCar('bison3')
						RageUI.CloseAll()
						GarageChocolatier = false
                    end
				end)
				
				
                RageUI.ButtonWithStyle("Véhicule de Patron", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
					if (Selected) then
						if ESX.PlayerData.job.grade_name == 'boss' then
						spawnCar('sultan')
						RageUI.CloseAll()
						GarageChocolatier = false
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

Chocolatier = {
    Garagec = {
        {pos = vector3(416.11, 6520.79, 27.74)}
    }
}

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(Chocolatier.Garagec) do
            if #(pCoords2 - v.pos) < 1.5 then
                activerfps = true
                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chocolatier' then
                 DrawMarker(22, 416.11, 6520.79, 27.74, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 88, 33, 33, 0, 0, 2, 3, nil, nil, 0)
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
------------------ Vestiaire Chocolatier -----------------
----------------------------------------------------------

local VestiaireChocolatier = false
RMenu.Add('vestiaire', 'main', RageUI.CreateMenu("Vestiaire Chocolatier", "Listes des Vêtements", 10,0))
RMenu:Get('vestiaire', 'main'):SetRectangleBanner(184, 105, 31, 255)
RMenu:Get('vestiaire', 'main').Closed = function()
	VestiaireChocolatier = false
end;

function OpenVestiaireChocolatier()
    if not VestiaireChocolatier then
        VestiaireChocolatier = true
        RageUI.Visible(RMenu:Get('vestiaire', 'main'), true)
            Citizen.CreateThread(function()
                while VestiaireChocolatier do
					Citizen.Wait(1)
					
					RageUI.IsVisible(RMenu:Get('vestiaire', 'main'), true, true, true, function()
                
						RageUI.Separator(' ↓ Vestiaire Chocolatier ↓ ')
										
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
								MettreVetChocolatier()
							end
						end)
						
						
						RageUI.ButtonWithStyle("Tenue de Patron", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered, Active, Selected)
							if (Selected) then
								--if ESX.PlayerData.job.grade_name == 'boss' then
								ExecuteCommand("e me")
								Citizen.Wait(1400)
								MettreVetPatronChocolatier()
							end
						--end
					end)
		
						end, function()
						end)
					end
				end)
			end
		end

Chocolat = {
	Vestiairec = {
		{pos = vector3(412.98, 6538.89, 27.74)}
	}
}
		
Citizen.CreateThread(function()
	while true do
			local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
			local activerfps2 = false
			local dst = GetDistanceBetweenCoords(pCoords2, true)
			for k,v in pairs(Chocolat.Vestiairec) do
				if #(pCoords2 - v.pos) < 1.5 then
					activerfps2 = true
					if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chocolatier' then
					DrawMarker(22, 412.98, 6538.89, 27.74, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 88, 33, 33, 0, 0, 2, 3, nil, nil, 0)
					RageUI.Text({ message = "Appuyez sur ~r~E~s~ pour accèder au ~b~Vestiaire", time_display = 1 })
						if IsControlJustReleased(0, 38) then
							OpenVestiaireChocolatier() 
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
------------------ Menu F6 - Chocolatier -----------------
----------------------------------------------------------

local Chocolatier_menu = false
RMenu.Add('Chocolatier_menuf6', 'main', RageUI.CreateMenu("Chocolatier", "", 10,0))
RMenu:Get('Chocolatier_menuf6', 'main'):SetSubtitle("~p~Menu Interactions")
RMenu:Get('Chocolatier_menuf6', 'main'):SetRectangleBanner(88, 33, 33, 255)
RMenu:Get('Chocolatier_menuf6', 'main').EnableMouse = false
RMenu:Get('Chocolatier_menuf6', 'main').Closed = function()
    Chocolatier_menu = false
end

function openChocolatier()
	if not Chocolatier_menu then
		Chocolatier_menu = true
		RageUI.Visible(RMenu:Get('Chocolatier_menuf6', 'main'), true)
	Citizen.CreateThread(function()
		while Chocolatier_menu do
			Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('Chocolatier_menuf6', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Factures", nil, {RightLabel = "~o~Facturer ~s~→→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Chocolatier', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
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
                                        TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Chocolatier', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
                                    else
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_chocolatier', 'Chocolatier', amount)
                
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

                        RageUI.ButtonWithStyle("Chocolatier ~g~Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown3, function(_,_,s)
                            if (s) then
                                codesCooldown3 = true 
                                TriggerServerEvent('Chocolat:AAAA')
                                Citizen.SetTimeout(60000, function() codesCooldown3 = false end)
                            end
                        end)
            
                        RageUI.ButtonWithStyle("Chocolatier ~r~Non-Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown4, function(_,_,s)
                            if (s) then
                                codesCooldown4 = true 
                                TriggerServerEvent('Chocolat:BBBB')
                                Citizen.SetTimeout(60000, function() codesCooldown4 = false end)
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
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chocolatier' then
        if IsControlJustReleased(0, 167) then
			openChocolatier()
		end
		end
	end
end)


----------------------------------------------------------
------------------ RangerV - Chocolatier -----------------
----------------------------------------------------------

function supprimer()
	GetEntityCoords(GetPlayerPed(-1), false)
	ExecuteCommand('dv')
end


local Chocolatier = {
    Rangerc = {
        {posranger = vector3(423.82, 6519.83, 27.67)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps3 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Chocolatier.Rangerc) do
                if #(pCoords2 - v.posranger) < 4 then
                    activerfps3 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chocolatier' then
                    DrawMarker(22, v.posranger.x, v.posranger.y, v.posranger.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
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
------------------ Recolte - Chocolatier -----------------
----------------------------------------------------------

local Chocolatier = {
    Recotlec = {
        {posrecoltec = vector3(470.65, 6491.14, 29.42)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps5 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Chocolatier.Recotlec) do
                if #(pCoords2 - v.posrecoltec) < 4 then
                    activerfps5 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chocolatier' then
                    DrawMarker(22, v.posrecoltec.x, v.posrecoltec.y, v.posrecoltec.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour récolter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ExecuteCommand("e mechanic")
                        Wait(5000)  
                        TriggerServerEvent("Chocolatier:RecolteChocolat", "chocolat", 1)     -- CHANGER LITEM QUE VOUS VOULEZ
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

local Chocolatier = {
    Traitementc = {
        {postraitementc = vector3(443.28, 6507.0, 28.85)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps6 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Chocolatier.Traitementc) do
                if #(pCoords2 - v.postraitementc) < 2 then
                    activerfps6 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chocolatier' then
                    DrawMarker(22, v.postraitementc.x, v.postraitementc.y, v.postraitementc.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour traiter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de Traiter")
                        ExecuteCommand("e mechanic")
                        Wait(2500)  
                        TriggerServerEvent("Chocolatier:traitementablette", "tablette")     -- CHANGER LITEM QUE VOUS VOULEZ
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
------------------ Vente Cghn Chocolatier ----------------
----------------------------------------------------------

local Chocolatier = {
    Ventec = {
        {posventec = vector3(443.59, 6502.79, 28.99)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps7 = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Chocolatier.Ventec) do
                if #(pCoords2 - v.posventec) < 2 then
                    activerfps7 = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chocolatier' then
                    DrawMarker(22, v.posventec.x, v.posventec.y, v.posventec.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour vendre", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de vendre")
                        TriggerServerEvent("Chocolatier:VenteTablette", "tablette")     -- CHANGER LITEM QUE VOUS VOULEZ
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
	{title="Chocolatier", colour=56, id=615, x = 416.22, y = 6520.95, z = 27.73},

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