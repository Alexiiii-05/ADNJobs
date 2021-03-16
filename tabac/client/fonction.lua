ESX =  nil 

function MettreVetTabac()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local clothesSkin = {
            ['bags_1'] = 0, ['bags_2'] = 0,
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 12, ['torso_2'] = 5,
            ['arms'] = 1,
            ['pants_1'] = 9, ['pants_2'] = 7,
            ['shoes_1'] = 7, ['shoes_2'] = 2,
            ['mask_1'] = 0, ['mask_2'] = 0,
            ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    end)
end

function MettreVetPatronTabac()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local clothesSkin = {
            ['bags_1'] = 0, ['bags_2'] = 0,
            ['tshirt_1'] = 57, ['tshirt_2'] = 0,
            ['torso_1'] = 13, ['torso_2'] = 5,
            ['arms'] = 11,
            ['pants_1'] = 9, ['pants_2'] = 7,
            ['shoes_1'] = 7, ['shoes_2'] = 2,
            ['mask_1'] = 0, ['mask_2'] = 0,
            ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    end)
end