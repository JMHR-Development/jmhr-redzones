lua54 "yes" 

--[[
       _ __  __ _    _ _____        _    _ _  __
      | |  \/  | |  | |  __ \      | |  | | |/ /
      | | \  / | |__| | |__) |     | |  | | ' / 
  _   | | |\/| |  __  |  _  /      | |  | |  <  
 | |__| | |  | | |  | | | \ \   _  | |__| | . \ 
  \____/|_|  |_|_|  |_|_|  \_\ (_)  \____/|_|\_\
                                                
]]


fx_version 'cerulean'
game 'gta5'

author 'JMHR Development'
description 'Made by JMHR Development - https://discord.gg/D2YwMYYtYh'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'shared/server_config.lua',
    'bridge/*.lua',
    'server/*.lua',
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/script.js',
}

