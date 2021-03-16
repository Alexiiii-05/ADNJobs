fx_version 'adamant'
game 'gta5'

author 'DakoM & Nehco & Alexi & Joulian '

version '1.1.0'

client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",
    "src/client/components/*.lua",
    "src/client/menu/elements/*.lua",
    "src/client/menu/items/*.lua",
    "src/client/menu/panels/*.lua",
    "src/client/menu/windows/*.lua",

    '@es_extended/locale.lua',
    "ammunation/client.lua", -- ammunation

    -- Taxi Jobs
    'Taxi/locales/fr.lua',
	'Taxi/config.lua',
    'Taxi/client/client.lua',
    'Taxi/client/cl_garage.lua',

    --Tabac Jobs 
    'tabac/client/client.lua',
    'tabac/client/fonction.lua',

    --Chocolatier Jobs 
    'chocolatier/client/cl_chocolatier.lua',
    'chocolatier/client/fonction.lua',

    --Brasseur Jobs 
    'brasseur/client/cl_brasseur.lua',
    'brasseur/client/fonction.lua',

    --Orpailleurs Jobs 
    'orpailleurs/client/cl_orpailleurs.lua',
    'orpailleurs/client/fonction.lua'

}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'ammunation/server.lua', -- ammunation

    -- Taxi Jobs 
    'Taxi/locales/fr.lua',
	'Taxi/config.lua',
    'Taxi/server/server.lua',
    'Taxi/function.lua',
    --Tabac Jobs
    'tabac/server/server.lua',

    --Chocolatier Jobs
    'tabac/server/sv_chocolatier.lua',

    --Chocolatier Jobs
    'brasseur/server/sv_brasseur.lua',

    --Orpailleurs Jobs
    'orpailleurs/server/sv_orpailleurs.lua',

}