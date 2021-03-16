ESX = nil
local openammumumec = false
local playman = GetPlayerPed(-1)
self = RageUI

Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(100) end end)

Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if NetworkIsSessionStarted() then
            TriggerServerEvent( "checkvipAccesories")
        end
    end
end) 

RegisterNetEvent('setvipaccesories')
AddEventHandler('setvipaccesories', function() 
    vip = true 
end)  

RMenu.Add('ammu', 'main', RageUI.CreateMenu("Ammu Nation","~b~Vice-Blue", 5,150))
RMenu:Get('ammu', 'main').Closed = function()
    openammumumec = false
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(0, 0, 0, 0, 0)
end

RMenu.Add('ammu', 'cate1', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "Armes Blanches", "~b~Que veux tu ?"))
RMenu.Add('ammu', 'cate2', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "Armes de Poing", "~b~Que veux tu ?"))
RMenu.Add('ammu', 'vip', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "V.I.P", "~b~Accesoires & Skin d'armes"))
RMenu.Add('ammu', 'skinarmes', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "V.I.P", "~b~Skin d'armes"))
RMenu.Add('ammu', 'accessoires', RageUI.CreateSubMenu(RMenu:Get('ammu', 'main'), "V.I.P", "~b~Accessoires d'armes"))

function openAmmumu() 
	if not openammumumec then
		openammumumec = true
		self.Visible(RMenu:Get('ammu', 'main'), true)
	Citizen.CreateThread(function()
		while openammumumec do
			Citizen.Wait(1)
                self.IsVisible(RMenu:Get('ammu', 'main'), true, true, true, function()
                    
                    self.ButtonWithStyle(" ÷ Armes Blanches ", nil, {RightLabel = "→→"},true, function()
                    end, RMenu:Get('ammu', 'cate1'))

                    self.ButtonWithStyle(" ÷ Armes de Poing", nil, {RightLabel = "→→"},true, function()
                    end, RMenu:Get('ammu', 'cate2'))

                    if vip == true then 
                        self.ButtonWithStyle("~y~V.I.P~s~", nil, {RightLabel = "→→"},true, function()
                        end, RMenu:Get('ammu', 'vip')) end             
                
                        if not vip == true then 
                            self.ButtonWithStyle("~m~ ÷ V.I.P", nil, { RightBadge = self.BadgeStyle.Lock }, true, function(Hovered, Active, Selected)
                                if Selected then
                                    ESX.ShowNotification("Tu dois être ~y~VIP~s~ pour profiter des avantages")
                                end
                            end)
                        end

                end, function() end)

                self.IsVisible(RMenu:Get('ammu', 'cate1'), true, true, true, function()

                    self.ButtonWithStyle("Couteau", nil, {RightLabel = "~g~→ 50$"},true, function(h, a, s)
                        if s then 
                            TriggerServerEvent('viceblue:giveitem', "weapon_knife", 0, 50) -- NOM DE LARMES, MUNITIONS DE GIVE, PRIX DE LARMES
                        end
                    end)
                    
                    self.ButtonWithStyle("Poing Americain", nil, {RightLabel = "~g~→ 80$"},true, function(h, a, s)
                        if s then 
                            TriggerServerEvent('viceblue:giveitem', "weapon_knuckle", 0, 50) -- NOM DE LARMES, MUNITIONS DE GIVE, PRIX DE LARMES
                        end
                    end)

                    self.ButtonWithStyle("Batte de Baseball", nil, {RightLabel = "~g~→ 120$"},true, function(h, a, s)
                        if s then 
                            TriggerServerEvent('viceblue:giveitem', "weapon_bat", 0, 50) -- NOM DE LARMES, MUNITIONS DE GIVE, PRIX DE LARMES
                        end
                    end)
                end)

                self.IsVisible(RMenu:Get('ammu', 'cate2'), true, true, true, function()

                    self.ButtonWithStyle("Pistolet", nil, {RightLabel = "~g~→ 50$"},true, function(h, a, s)
                        if s then 
                            TriggerServerEvent('viceblue:giveitem', "weapon_pistol", 0, 50) -- NOM DE LARMES, MUNITIONS DE GIVE, PRIX DE LARMES
                        end
                    end)
                    
                    self.ButtonWithStyle("Pistolet SNS", nil, {RightLabel = "~g~→ 80$"},true, function(h, a, s)
                        if s then 
                            TriggerServerEvent('viceblue:giveitem', "weapon_snspistol", 0, 50) -- NOM DE LARMES, MUNITIONS DE GIVE, PRIX DE LARMES
                        end
                    end)

                    self.ButtonWithStyle("Calibre 50", nil, {RightLabel = "~g~→ 120$"},true, function(h, a, s)
                        if s then 
                            TriggerServerEvent('viceblue:giveitem', "weapon_pistol50", 0, 50) -- NOM DE LARMES, MUNITIONS DE GIVE, PRIX DE LARMES
                        end
                    end)
                end)

                self.IsVisible(RMenu:Get('ammu', 'vip'), true, true, true, function()

                    self.ButtonWithStyle(" ÷ Accessoires", nil, {RightLabel = "→→"},true, function()
                    end, RMenu:Get('ammu', 'accessoires'))

                    self.ButtonWithStyle(" ÷ Skins", nil, {RightLabel = "→→"},true, function()
                    end, RMenu:Get('ammu', 'skinarmes')) end)

                self.IsVisible(RMenu:Get('ammu', 'skinarmes'), true, true, true, function()
                    if IsPedArmed(playman, 7) then
                        local _,pWeapon = GetCurrentPedWeapon(playman, 0)
                        local count = GetWeaponTintCount(pWeapon)
    
                        for i = 0, count - 1 do
                            RageUI.List("Teinture : "..GetTintName(i), nil, {}, true, function(_,h,s)
                                if s then
                                    SetPedWeaponTintIndex(playman, pWeapon, i)
                                    RageUI.GoBack()
                                end
                                if h then
                                    if GetPedWeaponTintIndex(playman, pWeapon) ~= i then
                                        SetPedWeaponTintIndex(playman, pWeapon, i)
                                    end
                                end
                            end)
                        end
                    else
                        RageUI.ButtonWithStyle("~r~Tu a besoin d'une arme", nil, {}, function()
                        end)
                    end
                end)

                self.IsVisible(RMenu:Get('ammu', 'accessoires'), true, true, true, function()

                    RageUI.ButtonWithStyle("~r~Accessoires", nil, {}, function()
                        if s then

                    end
                end)
                
            end, function() 
            end)
			end
		end)
	end
end

local function CamAmu()
    Wait(1)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, coords.x+1.0, coords.y+1.0, coords.z+0.9)
    SetCamFov(cam, 65.0)
    PointCamAtCoord(cam, coords.x, coords.y, coords.z+0.5)
    SetCamShakeAmplitude(cam, 13.0)
    RenderScriptCams(1, 1, 2000, 1, 1)
end

local lolxd = {
    posssmdr = {
        {posammu = vector3(21.75688, -1106.652, 29.79704)}
    }
}

Citizen.CreateThread(function()
    while true do
        local pCoords2 = GetEntityCoords(PlayerPedId())
        local activerfps = false
        local dst = GetDistanceBetweenCoords(pCoords2, true)
        for k,v in pairs(lolxd.posssmdr) do
            if #(pCoords2 - v.posammu) < 1.5 then
                activerfps = true
                DrawMarker(22, v.posammu.x, v.posammu.y, v.posammu.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 0, 0, 170, 0, 0, 0, 0, nil, nil, 0)
                self.Text({ message = "Appuyez sur ~r~E~s~ pour accèder au menu", time_display = 1 })
                if IsControlJustReleased(0, 38) then
                    openAmmumu()
                    CamAmu()
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetEntityHeading(PlayerPedId(), 329.8070)
                end
            end
        end
        if activerfps then
            Wait(1)
        else
            Wait(1200)
        end
    end
end)

function GetTintName(num)
    local tint = {
        [0] = {name = "Normal"},
        [1] = {name = "~g~Vert"},
        [2] = {name = "~y~Or"},
        [3] = {name = "~p~Rose"},
        [4] = {name = "~c~Armée"},
        [5] = {name = "~b~Bleue"},
        [6] = {name = "~o~Orange"},
        [7] = {name = "Platine"},
    }
    return tint[num].name
end
