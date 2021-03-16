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

local GarageTabac = false
RMenu.Add('garagetabac', 'main', RageUI.CreateMenu("Garage Tabagiste", "Listes des véhicules", 10,0))
RMenu:Get('garagetabac', 'main'):SetRectangleBanner(184, 105, 31, 255)
RMenu:Get('garagetabac', 'main').Closed = function()
    GarageTabac = false
end;

function OpenGarageTabac()
    if not GarageTabac then
        GarageTabac= true
        RageUI.Visible(RMenu:Get('garagetabac', 'main'), true)
            Citizen.CreateThread(function()
                while GarageTabac do
                    Wait(1)

            RageUI.IsVisible(RMenu:Get('garagetabac', 'main'), true, true, true, function()

                RageUI.Separator(' ↓ Véhicule Tabagiste ↓ ')
                RageUI.ButtonWithStyle("Véhicule de Travail", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        spawnCar('bison3')
                        RageUI.CloseAll()
                        GarageTabac = false
                    end
				end)
				
                RageUI.ButtonWithStyle("Véhicule de Patron", nil, {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
					if (Selected) then
						if ESX.PlayerData.job.grade_name == 'boss' then
                        spawnCar('crusader')
                        RageUI.CloseAll()
                        GarageTabac = false
                    else
                        ESX.ShowNotification('↓~o~Tabac:~s~↓  \nVous n\'avez le grade recquis pour faire apparaitre ce véhicule')
					end
                end
            end)

                end, function()
                end)
            end
        end)
	end
end

Cfg = {
    Garaget = {
        {posgarag = vector3(2335.828, 3118.302, 48.20356)}
    }
}

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(Cfg.Garaget) do
            if #(pCoords2 - v.posgarag) < 2 then
                activerfps = true
                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
                 DrawMarker(22, v.posgarag.x, v.posgarag.y, v.posgarag.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 184, 105, 31, 170, 1, 0, 2, 3, nil, nil, 0)
                RageUI.Text({ message = "Appuyez sur ~o~E~s~ pour accèder au Garage", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    OpenGarageTabac()
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

local VestiaireVigne = false
RMenu.Add('vestiaire', 'main', RageUI.CreateMenu("Vestiaire Tabagiste", "Listes des Vêtements", 10,0))
RMenu:Get('vestiaire', 'main'):SetRectangleBanner(184, 105, 31, 255)
RMenu:Get('vestiaire', 'main').Closed = function()
    VestiaireVigne = false
    RenderScriptCams(0, 1, 1000, 0, 0)
    FreezeEntityPosition(GetPlayerPed(-1), false)
end;

function OpenVestiaireTabac()
    if not VestiaireVigne then
        VestiaireVigne= true
        RageUI.Visible(RMenu:Get('vestiaire', 'main'), true)
            Citizen.CreateThread(function()
                while VestiaireVigne do
                    Citizen.Wait(1)

            RageUI.IsVisible(RMenu:Get('vestiaire', 'main'), true, true, true, function()
                
                RageUI.Separator(' ↓ Vestiaire Tabagiste ↓ ')
								
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
						MettreVetTabac()
                    end
                end)
				
				
                RageUI.ButtonWithStyle("Tenue de Patron", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered, Active, Selected)
					if (Selected) then
                        if ESX.PlayerData.job.grade_name == 'boss' then
                        ExecuteCommand("e me")
						Citizen.Wait(1400)
                        MettreVetPatronTabac()
					end
                end
            end)

                end, function()
                end)
            end
        end)
	end
end

Cfg2 = {
    Vestiairet = {
        {posvest = vector3(2359.341, 3118.893, 48.20874)}
    }
}

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
        local activerfps2 = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(Cfg2.Vestiairet) do
            if #(pCoords2 - v.posvest) < 2 then
                activerfps2 = true
                if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
                 DrawMarker(22, v.posvest.x, v.posvest.y, v.posvest.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 184, 105, 31, 170, 1, 0, 2, 3, nil, nil, 0)
                RageUI.Text({ message = "Appuyez sur ~o~E~s~ pour accèder au Vestiaire", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    OpenVestiaireTabac()
                    CamVestaireTabac()
                    FreezeEntityPosition(GetPlayerPed(-1), true)
                    SetEntityHeading(GetPlayerPed(-1), 47.304065704346)
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

local Tabac_menu = false

RMenu.Add('Tabac_menuf6', 'main', RageUI.CreateMenu("Tabac", "~o~Menu Interactions", 10,0))
RMenu:Get('Tabac_menuf6', 'main'):SetRectangleBanner(184, 105, 31, 255)
RMenu:Get('Tabac_menuf6', 'main').Closed = function()
    Tabac_menu = false
end

function openTabac()
	if not Tabac_menu then
		Tabac_menu = true
		RageUI.Visible(RMenu:Get('Tabac_menuf6', 'main'), true)
	Citizen.CreateThread(function()
		while Tabac_menu do
			Citizen.Wait(1)
                RageUI.IsVisible(RMenu:Get('Tabac_menuf6', 'main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Factures", nil, {RightLabel = "~o~Facturer ~s~→→"}, true, function(Hovered, Active, Selected) 
                        if (Selected) then
                            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                            if closestPlayer == -1 or closestDistance > 3.0 then
                                TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Tabac', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
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
                                        TriggerEvent("esx:showAdvancedNotification", '~r~Facture', '~r~Tabac', '~r~Il n\'y a personne autour de vous', 'CHAR_BLOCKED', 'spawn', 8)
                                    else
                                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_tabac', 'Tabac', amount)
                
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

                        RageUI.ButtonWithStyle("Tabagiste ~g~Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown1, function(_,_,s)
                            if (s) then
                                codesCooldown1 = true 
                                TriggerServerEvent('Tabac:Disponible')
                                Citizen.SetTimeout(60000, function() codesCooldown1 = false end)
                            end
                        end)
            
                        RageUI.ButtonWithStyle("Tabagiste ~r~Non-Disponible", nil, {RightLabel = "~o~Annoncer ~s~→→"}, not codesCooldown2, function(_,_,s)
                            if (s) then
                                codesCooldown2 = true 
                                TriggerServerEvent('Tabac:tabacNonDisponible')
                                Citizen.SetTimeout(60000, function() codesCooldown2 = false end)
                            end
                        end)
                        
                end, function()
                end)
            end
        end)
    end
end

local Tabac = {
    garage2 = {
        {posranger = vector3(2325.407, 3112.537, 48.15475)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Tabac.garage2) do
                if #(pCoords2 - v.posranger) < 4 then
                    activerfps = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
                    DrawMarker(22, v.posranger.x, v.posranger.y, v.posranger.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour ranger le véhicule", time_display = 1 })
                    if IsControlJustReleased(0, 38) then     
                        ESX.Game.DeleteVehicle(vehicle)      
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

local Tabac4 = {
    recotle = {
        {posrecolte = vector3(2358.31, 3139.088, 48.20871)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Tabac4.recotle) do
                if #(pCoords2 - v.posrecolte) < 4 then
                    activerfps = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
                    DrawMarker(22, v.posrecolte.x, v.posrecolte.y, v.posrecolte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour récolter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ExecuteCommand("e mechanic")
                        Wait(5000)  
                        TriggerServerEvent("Tabac:recolte", "bread", 1)     -- CHANGER LITEM QUE VOUS VOULEZ
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de récolter")
                        if IsControlJustReleased(0, 73) then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
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


local Tabac5 = {
    recotle2 = {
        {postraitement = vector3(2341.074, 3126.399, 48.20871)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Tabac5.recotle2) do
                if #(pCoords2 - v.postraitement) < 2 then
                    activerfps = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
                    DrawMarker(22, v.postraitement.x, v.postraitement.y, v.postraitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour traiter", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de traiter")
                        ExecuteCommand("e mechanic")
                        Wait(2500)  
                        TriggerServerEvent("Tabac:traitement", "bread")     -- CHANGER LITEM QUE VOUS VOULEZ
                        if IsControlJustReleased(0, 73) then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
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

local Tabac6 = {
    vente1 = {
        {posvente = vector3(2404.02, 3127.709, 48.15326)}
    }
}
    
Citizen.CreateThread(function()
    while true do
            local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
            local activerfps = false
            local dst = GetDistanceBetweenCoords(pCoords2, true)
            for k,v in pairs(Tabac6.vente1) do
                if #(pCoords2 - v.posvente) < 2 then
                    activerfps = true
                    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
                    DrawMarker(22, v.posvente.x, v.posvente.y, v.posvente.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 184, 105, 3, 170, 1, 0, 2, 0, nil, nil, 0)
                    RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour vendre", time_display = 1 })
                    if IsControlJustReleased(0, 38) then   
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_VEH_DUCK~ pour arretter de vendre")
                        TriggerServerEvent("Tabac:revente")     -- CHANGER LITEM QUE VOUS VOULEZ
                        if IsControlJustReleased(0, 73) then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
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

Citizen.CreateThread(function()
    while true do
		Wait(5)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
        if IsControlJustReleased(0, 167) then
			openTabac()
		end
        end
    end
end)

function CamVestaireTabac()
    camvesttab = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamActive(camvesttab, true)                                        -- heading
    SetCamParams(camvesttab, 2357.316, 3119.985, 48.20874, 2.367, 0.0, 234.34494018555, 20.0, 0, 1, 1, 2)
    SetCamFov(camvesttab, 55.0)
    RenderScriptCams(1, 1, 2200, 1, 1)
end

function spawnCar(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do Citizen.Wait(10) end
    local car = CreateVehicle(car, 2326.8, 3118.993, 48.16331, 351.92517089844, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
end

Citizen.CreateThread(function()
    
    local bliptabac = {
        {title="Garage", id=209, colour=51, scale = 0.5, x = 2336.585, y = 3117.963, z = 48.20578},
        {title="Garage", id=209, colour=51, scale = 0.5, x = 2325.371, y = 3112.647, z = 48.15413},
        {title="Vestiaire", id=209, colour=51, scale = 0.5, x = 2359.612, y = 3119.03, z = 48.20874},
        {title="Récolte", id=209, colour=51, scale = 0.5, x = 2358.31, y = 3139.088, z = 48.20871},
        {title="Vente", id=209, colour=51, scale = 0.5, x = 2403.918, y = 3127.675, z = 48.15316},
    }

    if ESX.PlayerData.job.name == nil and ESX.PlayerData.job.name == 'tabac' then
        for _, info in pairs(bliptabac) do
            info.shops = AddBlipForCoord(info.x, info.y, info.z)
            SetBlipSprite(info.shops, info.id)
            SetBlipDisplay(info.shops, 4)
            SetBlipScale(info.shops, info.scale)
            SetBlipColour(info.shops, info.colour)
            SetBlipAsShortRange(info.shops, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(info.shops)
        end
    end
end)
