local OnJob, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle = false, false, false, false
local CurrentCustomer, CurrentCustomerBlip, DestinationBlip, targetCoords

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(2)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

local TaxiMenu = false
RMenu.Add('Taxi', 'main', RageUI.CreateMenu("Taxi", "~y~Taxi"))
RMenu.Add('Taxi', 'citoyens', RageUI.CreateSubMenu(RMenu:Get('Taxi', 'main'), "Citoyens", nil))
RMenu:Get('Taxi', 'main'):SetRectangleBanner(201, 192, 14, 150)
RMenu:Get('Taxi', 'main').Closed = function()
    TaxiMenu = false
end;

function openTaxiMenu()
	if not TaxiMenu then
		TaxiMenu = true
		RageUI.Visible(RMenu:Get('Taxi', 'main'), true)
	Citizen.CreateThread(function()
		while TaxiMenu do
			Citizen.Wait(1)
			RageUI.IsVisible(RMenu:Get('Taxi', 'main'), true, true, true, function()
					
				RageUI.Separator("↓ Facturation ↓", nil, {}, true, function(a, a, s) end)

				RageUI.ButtonWithStyle("Donner une facture",nil, {RightLabel = ">"}, true, function(Hovered, Active, Selected)
					if Selected then
						RageUI.CloseAll()        
						OpenBillingMenu()
					end
				end)
	
                RageUI.Separator("↓~s~ Annonces ~s~↓", nil, {RightLabel = ""}, true, function(h, a, s) end)

					RageUI.ButtonWithStyle("Taxi ~g~Ouvert",nil, {RightLabel = "→→"}, not codesCooldown1, function(_,_,s)
						if (s) then
							codesCooldown1 = true 
							TriggerServerEvent('Taxi:Ouvert')
							Citizen.SetTimeout(60000, function() codesCooldown1 = false end)
						end
					end)
		
					RageUI.ButtonWithStyle("Taxi ~r~Fermer", nil, {RightLabel = "→→"}, not codesCooldown2, function(_,_,s)
						if (s) then
							codesCooldown2 = true 
							TriggerServerEvent('Taxi:Ferme')
							Citizen.SetTimeout(60000, function() codesCooldown2 = false end)
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
        Wait(3)
if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
    if IsControlJustReleased(0, 167) then
        openTaxiMenu()
	end end end end)


local TaxiVestaire = false
RMenu.Add('Taxi', 'vestaire', RageUI.CreateMenu(" Vestaires ", "Prenez vos vêtements"))
RMenu:Get('Taxi', 'vestaire'):SetRectangleBanner(201, 192, 14, 150)
RMenu:Get('Taxi', 'vestaire').Closed = function()
    TaxiVestaire = false
end;


local function Mettrevettaxi()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local clothesSkin = {
            ['tshirt_1'] = 6,  ['tshirt_2'] = 6,
            ['torso_1'] = 120,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 28,   ['pants_2'] = 2,
            ['shoes_1'] = 20,   ['shoes_2'] = 7,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = -1,    ['chain_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    end)
end


function openTaxiVestaire()
	if not TaxiVestaire then
		TaxiVestaire = true
		RageUI.Visible(RMenu:Get('Taxi', 'vestaire'), true)
            Citizen.CreateThread(function()
                while TaxiVestaire do
                    Citizen.Wait(1)

					RageUI.IsVisible(RMenu:Get('Taxi', 'vestaire'), true, true, true, function()

						RageUI.Separator("↓ ~y~Tenue Civil ~s~↓")

						RageUI.ButtonWithStyle("Tenue Civil", nil, {RightLabel = "→"}, true, function(Hovered, Active, s)
							if s then              
								ExecuteCommand("e me")
								Citizen.Wait(1400)
								ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
								ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
								TriggerEvent('skinchanger:loadSkin', skin)
								TriggerEvent('esx:restoreLoadout') end) end)
							end
						end)

					RageUI.Separator("↓ ~y~Tenue Taxi ~s~↓")

					RageUI.ButtonWithStyle("Tenue Job", nil, {RightLabel = "→"}, true, function(Hovered, Active, s)
						if s then              
							ExecuteCommand("e me")
							Citizen.Wait(1400)
							Mettrevettaxi()
						end
					end)
    
                end, function()
                end)
            end
        end)
    end
end




local Vestaire = {
    taxi = {
        {posvestirare = vector3(894.5002, -171.9735, 75.58267)}
    }
}


Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(GetPlayerPed(-1))
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(Vestaire.taxi) do
            if #(pCoords2 - v.posvestirare) < 1.5 then
                activerfps = true
				if ESX.PlayerData.job and ESX.PlayerData.job.name == 'taxi' then
				DrawMarker(22, v.posvestirare.x, v.posvestirare.y, v.posvestirare.z - 1.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 201, 192, 14, 155, 0, 0, 2, 0, 0, 0, 0)
                RageUI.Text({ message = "Appuyez sur ~y~E~s~ pour accèder au vestiaire", time_display = 1 })
                if IsControlJustReleased(0, 38) then     
                    openTaxiVestaire()      
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








function OpenBillingMenu()
	ESX.UI.Menu.Open(
	  'dialog', GetCurrentResourceName(), 'billing',
	  {
		title = "Factures"
	  },
	  function(data, menu)
		local amount = tonumber(data.value)
		local player, distance = ESX.Game.GetClosestPlayer()
		if player ~= -1 and distance <= 3.0 then
		  menu.close()
		  if amount == nil then
			  ESX.ShowNotification("~r~Problèmes~s~: Montant invalide")
		  else
			  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_taxi', ('Taxi'), amount)
			  Citizen.Wait(100)
			  ESX.ShowNotification("~r~Vous avez bien envoyer la facture")
		  end
		else
		  ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
		end
	  end,
	  function(data, menu)
		  menu.close()
	  end
	)
  end





-------------------- MISSION PNJ -----------------------------

function DrawSub(msg, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(msg)
	EndTextCommandPrint(time, 1)
end

function ShowLoadingPromt(msg, time, type)
	Citizen.CreateThread(function()
		Citizen.Wait(0)

		BeginTextCommandBusyspinnerOn('STRING')
		AddTextComponentSubstringPlayerName(msg)
		EndTextCommandBusyspinnerOn(type)
		Citizen.Wait(time)

		BusyspinnerOff()
	end)
end

function GetRandomWalkingNPC()
	local search = {}
	local peds   = ESX.Game.GetPeds()

	for i=1, #peds, 1 do
		if IsPedHuman(peds[i]) and IsPedWalking(peds[i]) and not IsPedAPlayer(peds[i]) then
			table.insert(search, peds[i])
		end
	end

	if #search > 0 then
		return search[GetRandomIntInRange(1, #search)]
	end

	for i=1, 250, 1 do
		local ped = GetRandomPedAtCoord(0.0, 0.0, 0.0, math.huge + 0.0, math.huge + 0.0, math.huge + 0.0, 26)

		if DoesEntityExist(ped) and IsPedHuman(ped) and IsPedWalking(ped) and not IsPedAPlayer(ped) then
			table.insert(search, ped)
		end
	end

	if #search > 0 then
		return search[GetRandomIntInRange(1, #search)]
	end
end

function ClearCurrentMission()
	if DoesBlipExist(CurrentCustomerBlip) then
		RemoveBlip(CurrentCustomerBlip)
	end

	if DoesBlipExist(DestinationBlip) then
		RemoveBlip(DestinationBlip)
	end

	CurrentCustomer           = nil
	CurrentCustomerBlip       = nil
	DestinationBlip           = nil
	IsNearCustomer            = false
	CustomerIsEnteringVehicle = false
	CustomerEnteredVehicle    = false
	targetCoords              = nil
end

function StartTaxiJob()
	ShowLoadingPromt(_U('taking_service'), 5000, 3)
	ClearCurrentMission()

	OnJob = true
end

function StopTaxiJob()
	local playerPed = PlayerPedId()

	if IsPedInAnyVehicle(playerPed, false) and CurrentCustomer ~= nil then
		local vehicle = GetVehiclePedIsIn(playerPed,  false)
		TaskLeaveVehicle(CurrentCustomer,  vehicle,  0)

		if CustomerEnteredVehicle then
			TaskGoStraightToCoord(CurrentCustomer,  targetCoords.x,  targetCoords.y,  targetCoords.z,  1.0,  -1,  0.0,  0.0)
		end
	end

	ClearCurrentMission()
	OnJob = false
	DrawSub(_U('mission_complete'), 5000)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)





-- Taxi Job
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if OnJob then
			if CurrentCustomer == nil then
				DrawSub(_U('drive_search_pass'), 5000)

				if IsPedInAnyVehicle(playerPed, false) and GetEntitySpeed(playerPed) > 0 then
					local waitUntil = GetGameTimer() + GetRandomIntInRange(30000, 45000)

					while OnJob and waitUntil > GetGameTimer() do
						Citizen.Wait(0)
					end

					if OnJob and IsPedInAnyVehicle(playerPed, false) and GetEntitySpeed(playerPed) > 0 then
						CurrentCustomer = GetRandomWalkingNPC()

						if CurrentCustomer ~= nil then
							CurrentCustomerBlip = AddBlipForEntity(CurrentCustomer)

							SetBlipAsFriendly(CurrentCustomerBlip, true)
							SetBlipColour(CurrentCustomerBlip, 2)
							SetBlipCategory(CurrentCustomerBlip, 3)
							SetBlipRoute(CurrentCustomerBlip, true)

							SetEntityAsMissionEntity(CurrentCustomer, true, false)
							ClearPedTasksImmediately(CurrentCustomer)
							SetBlockingOfNonTemporaryEvents(CurrentCustomer, true)

							local standTime = GetRandomIntInRange(60000, 180000)
							TaskStandStill(CurrentCustomer, standTime)

							ESX.ShowNotification(_U('customer_found'))
						end
					end
				end
			else
				if IsPedFatallyInjured(CurrentCustomer) then
					ESX.ShowNotification(_U('client_unconcious'))

					if DoesBlipExist(CurrentCustomerBlip) then
						RemoveBlip(CurrentCustomerBlip)
					end

					if DoesBlipExist(DestinationBlip) then
						RemoveBlip(DestinationBlip)
					end

					SetEntityAsMissionEntity(CurrentCustomer, false, true)

					CurrentCustomer, CurrentCustomerBlip, DestinationBlip, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle, targetCoords = nil, nil, nil, false, false, false, nil
				end

				if IsPedInAnyVehicle(playerPed, false) then
					local vehicle          = GetVehiclePedIsIn(playerPed, false)
					local playerCoords     = GetEntityCoords(playerPed)
					local customerCoords   = GetEntityCoords(CurrentCustomer)
					local customerDistance = #(playerCoords - customerCoords)

					if IsPedSittingInVehicle(CurrentCustomer, vehicle) then
						if CustomerEnteredVehicle then
							local targetDistance = #(playerCoords - targetCoords)

							if targetDistance <= 10.0 then
								TaskLeaveVehicle(CurrentCustomer, vehicle, 0)

								ESX.ShowNotification(_U('arrive_dest'))

								TaskGoStraightToCoord(CurrentCustomer, targetCoords.x, targetCoords.y, targetCoords.z, 1.0, -1, 0.0, 0.0)
								SetEntityAsMissionEntity(CurrentCustomer, false, true)
								TriggerServerEvent('esx_taxijob:success')
								RemoveBlip(DestinationBlip)

								local scope = function(customer)
									ESX.SetTimeout(60000, function()
										DeletePed(customer)
									end)
								end

								scope(CurrentCustomer)

								CurrentCustomer, CurrentCustomerBlip, DestinationBlip, IsNearCustomer, CustomerIsEnteringVehicle, CustomerEnteredVehicle, targetCoords = nil, nil, nil, false, false, false, nil
							end

							if targetCoords then
								DrawMarker(36, targetCoords.x, targetCoords.y, targetCoords.z + 1.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 234, 223, 72, 155, false, false, 2, true, nil, nil, false)
							end
						else
							RemoveBlip(CurrentCustomerBlip)
							CurrentCustomerBlip = nil
							targetCoords = Config.JobLocations[GetRandomIntInRange(1, #Config.JobLocations)]
							local distance = #(playerCoords - targetCoords)
							while distance < Config.MinimumDistance do
								Citizen.Wait(5)

								targetCoords = Config.JobLocations[GetRandomIntInRange(1, #Config.JobLocations)]
								distance = #(playerCoords - targetCoords)
							end

							local street = table.pack(GetStreetNameAtCoord(targetCoords.x, targetCoords.y, targetCoords.z))
							local msg    = nil

							if street[2] ~= 0 and street[2] ~= nil then
								msg = string.format(_U('take_me_to_near', GetStreetNameFromHashKey(street[1]), GetStreetNameFromHashKey(street[2])))
							else
								msg = string.format(_U('take_me_to', GetStreetNameFromHashKey(street[1])))
							end

							ESX.ShowNotification(msg)

							DestinationBlip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)

							BeginTextCommandSetBlipName('STRING')
							AddTextComponentSubstringPlayerName('Destination')
							EndTextCommandSetBlipName(blip)
							SetBlipRoute(DestinationBlip, true)

							CustomerEnteredVehicle = true
						end
					else
						DrawMarker(36, customerCoords.x, customerCoords.y, customerCoords.z + 1.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 234, 223, 72, 155, false, false, 2, true, nil, nil, false)

						if not CustomerEnteredVehicle then
							if customerDistance <= 40.0 then

								if not IsNearCustomer then
									ESX.ShowNotification(_U('close_to_client'))
									IsNearCustomer = true
								end

							end

							if customerDistance <= 20.0 then
								if not CustomerIsEnteringVehicle then
									ClearPedTasksImmediately(CurrentCustomer)

									local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

									for i=maxSeats - 1, 0, -1 do
										if IsVehicleSeatFree(vehicle, i) then
											freeSeat = i
											break
										end
									end

									if freeSeat then
										TaskEnterVehicle(CurrentCustomer, vehicle, -1, freeSeat, 2.0, 0)
										CustomerIsEnteringVehicle = true
									end
								end
							end
						end
					end
				else
					DrawSub(_U('return_to_veh'), 5000)
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while onJob do
		Citizen.Wait(10000)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade < 3 then
			if not IsInAuthorizedVehicle() then
				ClearCurrentMission()
				OnJob = false
				ESX.ShowNotification(_U('not_in_taxi'))
			end
		end
	end
end)